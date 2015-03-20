class AddFieldsToMethodSet < ActiveRecord::Migration
  def change
    add_column :method_result_sets, :number_of_lines, :integer
    add_column :method_result_sets, :complexity, :integer
 end
end
