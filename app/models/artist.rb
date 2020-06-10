
class Artist < ActiveRecord::Base
  has_many :songs

  include Sluggable

  def genres
    songs.map(&:genres).flatten.uniq
  end
end