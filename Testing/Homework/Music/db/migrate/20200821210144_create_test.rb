class CreateTest < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :user, null: false
    end
  end
end
