module FlashHelper
  def flash_message(notice_type)
    if flash[notice_type]
      content_tag :p, flash[notice_type], class: 'flash alert'
    end
  end
end