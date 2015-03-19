class CreateMethoods < ActiveRecord::Migration
  def change
    create_table :methoods do |t|

      t.timestamps
    end
  end
end
