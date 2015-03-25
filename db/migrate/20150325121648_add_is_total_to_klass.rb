class AddIsTotalToKlass < ActiveRecord::Migration
  def change
    add_column :klasses, :is_total, :boolean
  end
end
