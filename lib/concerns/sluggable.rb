module Sluggable
  def self.included(klass)
    klass.extend ClassMethods
  end

  def slug
    name.split(" ").map(&:downcase).join("-")
  end

  module ClassMethods
    def find_by_slug(slug)
      where("lower(name) = ?", unslug(slug)).first
    end

  private

    def unslug(slug)
      slug.tr("-", " ")
    end
  end
end
