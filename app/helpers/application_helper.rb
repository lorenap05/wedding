module ApplicationHelper
  def safe_image_tag(source, fallback: nil, **options)
    image_tag(source, **options)
  rescue StandardError
    return "".html_safe if fallback.blank?

    image_tag(fallback, **options)
  end
end