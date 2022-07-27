class AddPartNumberToProducts < ActiveRecord::Migration[7.0]
  def change
    change_table :books do |t|
      t.rename :name, :title
    end
  end
end
