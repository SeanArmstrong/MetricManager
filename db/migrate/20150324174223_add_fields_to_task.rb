class AddFieldsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :name, :string
    add_column :tasks, :description, :string
    add_column :tasks, :complete, :boolean
  end
end
