class CreateCarModels < ActiveRecord::Migration[6.0]
  def change
    create_table :car_models do |t|
      t.string :name
      t.integer :year
      t.references :manufacturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
