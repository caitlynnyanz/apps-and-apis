class ChangeToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :listings, :price, :decimal, precision: 12, scale: 2
    change_column :listings, :square_feet, :decimal, precision: 9, scale: 2
  end
end
