class CreateCarCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :car_categories do |t|
      t.string :name
      t.decimal :daily_rate

      t.timestamps
    end
  end
end
