class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.integer :number
      t.string :name
      t.text :information

      t.timestamps
    end
  end
end
