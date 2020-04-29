class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.date :start_date
      t.date :end_date
      t.references :customer, null: false, foreign_key: true
      t.references :car_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
