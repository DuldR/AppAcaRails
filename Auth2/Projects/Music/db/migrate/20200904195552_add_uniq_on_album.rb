class AddUniqOnAlbum < ActiveRecord::Migration[5.2]
  def change
    add_index :tracks, [:title, :album_id], unique: true
  end
end
