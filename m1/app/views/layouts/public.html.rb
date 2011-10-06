require File.expand_path "../../layout.rb", __FILE__

class Layout::Public::HTML < Erector::Widgets::Page
  def content
    text raw doctype
    html do
      head do
        title page_title
        meta :name => "Description", :content => "Free and easy dialog hosting."
        meta :'http-equiv'=> "content-type", :content => "text/html; charset=utf-8"
        link :rel => "shortcut icon", :href => "/favicon.ico"
        link :href => "/css/common.css", :rel => "stylesheet", :type => "text/css"
        script :src => "/js/prototype.js", :type => "text/javascript"
        script :src => "/js/scriptaculous.js?load=effects", :type => "text/javascript"
      end
      body :class => "#{self.class.name.cssify}" do
        div :class => 'header' do
          render_header
        end
        div :class => 'content' do
          render_content
        end
        div :class => 'footer' do
          render_footer
        end
        render_scripts
      end
    end
  end

  def render_header
  end

  def render_nav
  end

  def render_content
    headline
  end

  def render_footer
  end

  def render_scripts
  end

  def page_title
    "#{@title ? "#{@title} | " : ''}Dialog is..."
  end

  def headline
    h1 @title if @title
  end
end
