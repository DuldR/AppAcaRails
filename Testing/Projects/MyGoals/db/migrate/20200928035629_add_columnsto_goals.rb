class AddColumnstoGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :title, :string, null: false
    add_column :goals, :is_public, :boolean, :default => false
    add_column :goals, :status, :string, null: false
  end
end
