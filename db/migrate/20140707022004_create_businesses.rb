class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :country
      
      t.timestamps
    end
  end
end
