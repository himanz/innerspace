class AddStateAndCountryToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :state, :string
    add_column :businesses, :country, :string
  end
end
