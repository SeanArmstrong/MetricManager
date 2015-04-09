class AddSettingsToTaskAndProject < ActiveRecord::Migration
  def change
    add_column :projects, :display_tasks, :boolean
    add_column :tasks, :visible_on_graphs, :boolean
  end
end
