class AddCbpToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :cbp, :string
  end
end
