class AddFieldsToClass < ActiveRecord::Migration
  def change
    add_column :klasses, :name, :string
    add_column :klasses, :package, :string
    add_column :klasses, :variables, :integer
    add_column :klasses, :public_variables, :integer
    add_column :klasses, :protected_variables, :integer
    add_column :klasses, :private_variables, :integer
    add_column :klasses, :number_of_lines, :integer
    add_column :klasses, :number_of_methods, :integer
    add_column :klasses, :average_lines_per_method, :float
    add_column :klasses, :average_method_complexity, :float
    add_column :klasses, :weighted_methods_per_class, :float
    add_column :klasses, :depth_of_inheritance, :integer
    add_column :klasses, :LCOM, :float 
    add_column :klasses, :CBO, :float
  end
end
