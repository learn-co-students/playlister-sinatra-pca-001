require_relative "slugify.rb"

class Song < ActiveRecord::Base
  include Slugify
  extend Slugify::SlugClass

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
