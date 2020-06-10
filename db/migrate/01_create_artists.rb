class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |table|
      table.string :name
    end
  end
end