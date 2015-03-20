class CreateKlassResultSets < ActiveRecord::Migration
  def change
    create_table :klass_result_sets do |t|

      t.timestamps
    end
  end
end
