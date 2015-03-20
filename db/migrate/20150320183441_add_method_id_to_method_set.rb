class AddMethodIdToMethodSet < ActiveRecord::Migration
  def change
    add_column :method_result_sets, :method_id, :integer
  end
end
