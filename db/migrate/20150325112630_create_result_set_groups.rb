class CreateResultSetGroups < ActiveRecord::Migration
  def change
    create_table :result_set_groups do |t|

      t.timestamps
    end
  end
end
