class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.string :city
      t.integer :temp
      t.string :condition
      t.integer :humidity

      t.timestamps null: false
    end
  end
end
