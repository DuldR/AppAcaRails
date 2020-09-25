class AddUniqOnOrd < ActiveRecord::Migration[5.2]
  def change
    add_index :tracks, [:ord, :album_id], unique: true
  end
end
