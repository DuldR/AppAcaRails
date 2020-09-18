class AddKeysToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :track_id, :integer, null: false
    add_column :notes, :user_id, :integer, null: false
    rename_column :notes, :note, :body
  end
end
