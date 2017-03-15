module ApplicationHelper

	def flash_messages(opts = {})
    flash.map do |msg_type, message|
      content_tag(:div, message) do
        content_tag(:button, '&times'.html_safe, class: 'close', data: {dismiss: 'alert'}) + message
      end
    end.join.html_safe
  end


end
