class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|

      t.timestamps
    end
  end
end
