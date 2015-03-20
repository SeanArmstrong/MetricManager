class AddFieldsToClassSet < ActiveRecord::Migration
  def change
    add_column :klass_result_sets, :variables, :integer
    add_column :klass_result_sets, :public_variables, :integer
    add_column :klass_result_sets, :protected_variables, :integer
    add_column :klass_result_sets, :private_variables, :integer
    add_column :klass_result_sets, :number_of_lines, :integer
    add_column :klass_result_sets, :number_of_methods, :integer
    add_column :klass_result_sets, :average_lines_per_method, :float
    add_column :klass_result_sets, :average_method_complexity, :float
    add_column :klass_result_sets, :weighted_methods_per_class, :float
    add_column :klass_result_sets, :depth_of_inheritance, :integer
    add_column :klass_result_sets, :LCOM, :float 
    add_column :klass_result_sets, :CBO, :float
  end
end
