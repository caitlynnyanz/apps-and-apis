class ChangeToBoolean < ActiveRecord::Migration[7.0]
  def change
    change_column :listings, :availability, "boolean USING CAST(availability AS boolean)"
    change_column :listings, :availability, :boolean, default: true
  end
end
