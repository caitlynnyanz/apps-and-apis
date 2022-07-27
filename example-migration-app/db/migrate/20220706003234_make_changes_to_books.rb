class MakeChangesToBooks < ActiveRecord::Migration[7.0]
  def change

    # Renaming a column in database - table/old column name/new column name
    rename_column :books, :name, :title

    #Change cloumn type - table/column/ new type
    change_column :books, :description, :text

    #Change price column from int to decimal - tbale/column/new type/ modifiers
    change_column :books, :price, :decimal, precision: 9, scale: 2

    #Remove column - table/column/type
    remove_column :books, :isbn, :string

    #Example - change string value to decimal
    # change_column :books, :price, "numeric USING CAST (price AS numeric)"
    # change_column :books, :price, :decimal, precision: 9, scale: 2

  end
end
