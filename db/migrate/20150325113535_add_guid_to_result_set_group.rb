class AddGuidToResultSetGroup < ActiveRecord::Migration
  def change
    add_column :result_set_groups, :upload_guid, :string
  end
end
