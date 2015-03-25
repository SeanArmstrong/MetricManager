class AddIsTotalFlagToKlassResultSets < ActiveRecord::Migration
  def change
    add_column :klass_result_sets, :is_total, :boolean
  end
end
