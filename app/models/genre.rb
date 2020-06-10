require_relative "slugify.rb"

class Genre < ActiveRecord::Base
  include Slugify
  extend Slugify::SlugClass

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
