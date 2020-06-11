require_relative "./concerns/slugifiable"

class Artist < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
    all.find { |artist| artist.slug == slug }
  end
end
