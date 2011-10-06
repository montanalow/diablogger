require 'rubygems'
require 'bundler'
Bundler.setup
require 'rack'
require 'dm-core'
require 'dm-validations'
require 'erector'
require 'logger'

class App
end

module App::Logger
  private
  @@logger

  public
  def self.included base
    base.extend ClassMethods
  end

  def logger
    self.class.logger
  end

  module ClassMethods
    def logger
      @@logger ||= Logger.new ENV['LOG']
    end

    def logger= logger
      @@logger = logger
    end
  end
end


module App::Flash
  def self.included base
    base.extend ClassMethods
  end

  def flash
    self.class.flash
  end

  module ClassMethods
    def flash
      @@logger ||= Flash.new
    end
  end
end

class App::Dispatch
  private
  include App::Logger
  @@routes = Hash.new{|hash,key| hash[key] = {:GET => {}, :POST => {}, :PUT => {}, :DELETE => {}, :REGEXPS => {:GET => {}, :POST => {}, :PUT => {}, :DELETE => {}}}}

  def self.call env
    request = Rack::Request.new env
    destination = lookup request.request_method, request.path
    if destination.is_a? Proc
      instance = (destination.binding.eval 'self').new request
      ((instance.instance_eval &destination).call request).response.finish
    else
      (destination.call request).response.finish
    end
  end

  def self.lookup method, path
    path, format = path.split '.'
    method = method.to_sym
    path = path.to_sym
    format = (format || :html).to_sym
    destination = @@routes[format][method][path]
    if destination
      return destination
    else
      @@routes[format][:REGEXPS][method].each do |route, destination|
        if path.match route
          return destination
        end
      end
    end
    Public::NotFound
  end

  def self.add_route *args, &block
    method = args[0]
    if block_given?
      path, format = args[1].split '.'
      destination = block
    elsif args[1].is_a? Hash
      path, format = args[1].first[0].split '.'
      destination = args[1].first[1]
    end

    format = (format || :html).to_sym
    logger.info "Adding route: Method: #{method.inspect} Path: #{path.inspect} Format: #{format.inspect} => #{destination}"
    if path.include? ':'
      path.gsub! /:([^\/\.]*)/, "([^\/\.]*)"
      @@routes[format][:REGEXPS][method][Regexp.new path] = destination
    else
      @@routes[format][method][path.to_sym] = destination
    end
  end
end

module App::Controller
  attr_reader :request, :params, :cookies, :session

  def initialize request
    @request = request
  end

  private
  def self.included base
    base.extend ClassMethods
    base.extend Forwardable
    base.instance_eval do
      include App::Logger
      def_delegators :@request, :session, :params, :cookies
    end
  end

  module ClassMethods
    def get *args, &block
      App::Dispatch.add_route :GET, *args, &block
    end

    def post *args, &block
      App::Dispatch.add_route :POST, *args, &block
    end

    def put *args, &block
      App::Dispatch.add_route :PUT, *args, &block
    end

    def delete *args, &block
      App::Dispatch.add_route :DELETE, *args, &block
    end
  end

  def render view, instance_variables
    view.call env, request, instance_variables
  end
end

class App::View < Erector::Widgets::Page
  include App::Logger

  attr_reader :status, :content, :content_type, :env, :request, :params, :response

  def self.call request
    self.new request
  end

  def initialize request, instance_variables = {}
    @status, @content_type, @env, @request, @params = 200, "text/html; charset=utf-8", env, request, request.params.symbolize_keys
    super instance_variables
  end

  def response
    Rack::Response.new self.to_s, status, {"Content-Type" => content_type}
  end
end

class App
  include App::Logger

  @@cache_files, @@serve_public = true, false
  cattr_accessor :cache_files, :serve_public

  def self.load
    load_files Dir.new File.expand_path "../../lib", __FILE__
    load_files Dir.new File.expand_path "../", __FILE__
  end
  
  def self.load_files dir
    logger.debug "Loading: #{dir.inspect}"
    dir.entries.select{|file| !['.','..','app.rb'].include? file}.each do |file|
      path = File.join dir.path, file
      if File.directory? path
        load_files Dir.new path
      else
        Kernel::load path
      end
    end
  end
end

require File.expand_path "../../config/config", __FILE__

App.load
