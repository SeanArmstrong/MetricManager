class CreateMethodResultSets < ActiveRecord::Migration
  def change
    create_table :method_result_sets do |t|

      t.timestamps
    end
  end
end
