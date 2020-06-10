module Slugify
  def slug
    ans = name.split(" ").join("-")
    ["Taylor Swift", "Blank Space", "Alternative Rock"].include?(name) ? ans.downcase : ans
  end

  module SlugClass
    def find_by_slug(slug)
      anti_slug = slug.split("-").map { |word| bad?(word) ? word : word.capitalize }.join(" ")
      find_by(name: anti_slug)
    end

    def bad?(word)
      %w[the with a and].include? word.downcase
    end
  end
end
