module FlashHelper
  def flash_message(notice_type)
    if flash[notice_type]
      content_tag :p, flash[notice_type], class: 'flash alert'
    end
  end

  def flash_class(key)
    case key
    when 'notice'
      'alert alert-primary'
    when 'alert'
      "alert alert-warning"
    end
  end
end