require_relative "./concerns/slugifiable"


class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def self.find_by_slug(slug)
    all.find { |genre| genre.slug == slug }
  end
end