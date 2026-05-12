module ApplicationHelper
  def safe_image_tag(source, fallback: nil, **options)
    # If a fallback is provided, always use it.
    # (image_tag does not raise when an image is missing, so rescue won't help.)
    return image_tag(fallback, **options) if fallback.present?

    source = source.to_s
    source = source.sub(/\Awedding\//, "") # avoid /wedding/wedding/...
    source = "/wedding/#{source}" unless source.start_with?("/", "http")

    image_tag(source, **options)
  end
end
