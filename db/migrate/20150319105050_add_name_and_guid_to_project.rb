class AddNameAndGuidToProject < ActiveRecord::Migration
  def change
    add_column :projects, :name, :string
    add_column :projects, :guid, :string
  end
end
