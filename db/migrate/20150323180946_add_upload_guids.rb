class AddUploadGuids < ActiveRecord::Migration
  def change
    add_column :klass_result_sets, :upload_guid, :string
    add_column :method_result_sets, :upload_guid, :string
  end
end
