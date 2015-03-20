class AddFieldsToClass < ActiveRecord::Migration
  def change
    add_column :klasses, :name, :string
    add_column :klasses, :package, :string
  end
end
