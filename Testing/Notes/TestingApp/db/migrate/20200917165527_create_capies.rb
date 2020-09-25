class CreateCapies < ActiveRecord::Migration[5.2]
  def change
    create_table :capies do |t|
      t.string :name, null: false
      t.string :color, null: false
      t.timestamps null: false
    end
  end
end
