class ChangeGroupSystemForKlassesAndMethods < ActiveRecord::Migration
  def change
    remove_column :klass_result_sets, :upload_guid
    remove_column :method_result_sets, :upload_guid
    add_column :klass_result_sets, :result_set_group_id, :integer
    add_column :method_result_sets, :result_set_group_id, :integer
  end
end
