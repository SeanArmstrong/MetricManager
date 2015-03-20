class AddFieldsToMethod < ActiveRecord::Migration
  def change
    add_column :methoods, :name, :string
    add_column :methoods, :return_type, :string
    add_column :methoods, :klass_id, :integer
  end
end
