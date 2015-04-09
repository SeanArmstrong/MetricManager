class AddSdmcToKlassResultSets < ActiveRecord::Migration
  def change
    add_column :klass_result_sets, :sdmc, :float
  end
end
