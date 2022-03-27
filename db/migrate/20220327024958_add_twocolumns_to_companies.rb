class AddTwocolumnsToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :total, :integer
    add_column :companies, :dividend, :float
  end
end
