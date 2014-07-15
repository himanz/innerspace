class AddLatitudeAndLongitudeToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :latitude, :decimal
    add_column :businesses, :longitude, :decimal
  end
end
