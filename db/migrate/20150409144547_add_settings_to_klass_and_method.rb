class AddSettingsToKlassAndMethod < ActiveRecord::Migration
  def change
    add_column :klasses, :display_tasks, :boolean
    add_column :methoods, :display_tasks, :boolean
  end
end
