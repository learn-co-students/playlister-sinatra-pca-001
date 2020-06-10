class CreateSongGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :song_genres do |t|
      t.integer :song_id, null: false
      t.integer :genre_id, null: false
      t.timestamps(null: false)
    end
  end
end
