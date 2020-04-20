class AddInsuranceToCarCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :car_categories, :car_insurance, :decimal
    add_column :car_categories, :third_part_insurance, :decimal
  end
end
