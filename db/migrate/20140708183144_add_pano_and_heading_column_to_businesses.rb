class AddPanoAndHeadingColumnToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :pano, :string
    add_column :businesses, :heading, :decimal
  end
end
