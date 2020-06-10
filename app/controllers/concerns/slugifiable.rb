module Slugify
  def slug
    name.parameterize
  end

  def find_by_slug(slug)
    all.find { |instance| instance.slug == slug }
  end
end
