class AddCodeToRental < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :code, :string
  end
end
