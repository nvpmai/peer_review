module ApplicationHelper
  def message_class_for(flash_type)
    { success: 'positive', notice: 'info' }[flash_type.to_sym]
  end

  def flash_messages
    flash.map do |msg_type, message|
      content_tag(:div, class: "ui message #{message_class_for(msg_type)}") do
        content_tag :i, class: 'close icon'
        content_tag :div, message, class: 'header'
      end
    end.join.html_safe
  end
end
