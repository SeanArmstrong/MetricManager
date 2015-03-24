class ChangeMethodIdToMethoodId < ActiveRecord::Migration
  def change
    rename_column :method_result_sets, :method_id, :methood_id
  end
end
