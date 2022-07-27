class DeleteFloors < ActiveRecord::Migration[7.0]
  def change
    remove_column :listings, :floors, :integer
  end
end
