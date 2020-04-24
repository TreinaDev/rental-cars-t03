class CreateSubsidiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :subsidiaries do |t|
      t.string :name
      t.string :cnpj
      t.string :address

      t.timestamps
    end
  end
end
