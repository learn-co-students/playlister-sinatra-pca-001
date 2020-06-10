require_relative "slugify.rb"

class Artist < ActiveRecord::Base
  include Slugify
  extend Slugify::SlugClass

  has_many :songs
  has_many :genres, through: :songs
end
