class AddKlassIdToKlassSet < ActiveRecord::Migration
  def change
    add_column :klass_result_sets, :klass_id, :integer 
  end
end
