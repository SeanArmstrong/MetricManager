class AddClassToProject < ActiveRecord::Migration
  def change
    add_column :klasses, :project_id, :integer
  end
end
