class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |table|
      table.string :name
      table.integer :artist_id
    end
  end
end