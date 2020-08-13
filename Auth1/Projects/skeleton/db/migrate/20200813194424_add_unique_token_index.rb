class AddUniqueTokenIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :users, [:username, :session_token], unique: true
  end
end
