require_relative "../controllers/concerns/slugifiable.rb"

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugify
  extend Slugify
end
