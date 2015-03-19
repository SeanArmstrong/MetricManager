class AddFieldsToMethod < ActiveRecord::Migration
  def change
    add_column :methoods, :name, :string
    add_column :methoods, :number_of_lines, :integer
    add_column :methoods, :complexity, :integer
    add_column :methoods, :return_type, :string
    add_column :methoods, :klass_id, :integer
  end
end
