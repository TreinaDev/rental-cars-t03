class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :license_plate
      t.string :color
      t.belongs_to :car_model, null: false, foreign_key: true
      t.integer :milage

      t.timestamps
    end
  end
end
