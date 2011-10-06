ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  # ignore method name for error messages that begin with '^'
  if instance.error_message.to_a.first.first == '^'
    field_name = ''
  else
    field_name = instance.method_name.humanize + " "
  end

  # remove leading ^ from error messages
  messages = instance.error_message.to_a.map{ |message| message.first == '^' ? message[1,message.length] : message }

  # build the body from the array of messages
  if messages.size > 1
    # join all but the last error message with a ,
    message = messages[0,messages.length - 1].join ", "
    # join the last error message with and
    message += " and " + messages.last
  else
    message = messages.first
  end
  "<div class=\"field_with_errors\">" +
    (html_tag[1..5] == "label" ? '' : "<label for=\"#{instance.object_name + '_' + instance.method_name}\" class=\"error_message\">#{field_name}#{message}</label>") +
    "#{html_tag}" +
  "</div>"
end

module ActionView
  class Base
     
    def a_or_an word
      word = word.strip
      if %w{a e i o u A E I O U}.include? word[0..0].to_s
        "an #{word}"
      else
        "a #{word}"
      end
    end 
  end
  
end
#  module Helpers
#    module TagHelper
#      alias_method :original_tag, :tag
#      def tag(name, options = nil, open = false, escape = true)
#        ActiveRecord::Base.logger.debug "0000000000000000000000000000000000000000000000000000000000000000#{options.inspect}"
#        options[:class] = [options[:class], "radio_button"].join " "
#        original_tag name, options, open, escape
#      end
#    end
#  end
#end
