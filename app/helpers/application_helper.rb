module ApplicationHelper
  def safe_image_tag(source, fallback: nil, **options)
    source = source.to_s
    # If caller passes "wedding/history_1", serve it from public/assets/...
    source = "/assets/#{source}" unless source.start_with?("/", "http")

    image_tag(source, **options)
  rescue StandardError
    return "".html_safe if fallback.blank?

    image_tag(fallback, **options)
  end
end
