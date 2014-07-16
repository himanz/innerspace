# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :business do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    pano "3L5NCiIf__oAAAQIt-clrA"
    heading 200
    cbp ",191.0,,0,-0.0"
    category_id 1
    latitude 45.342201
    longitude -79.142333
    state "Ontario"
    country "Canada"

    factory :invalid_business do
  	  name nil
    end

    factory :default do
    	name "Default Cafe"
    	address "1 Default Drive"
    	pano "3L5NCiIf__oAAAQIt-clrA"
    	heading 200
    	cbp ",191.0,,0,-0.0"
    	category_id 1
    end

    factory :hotel1_business do
      name "Holiday"
      category_id 1
    end

    factory :hotel2_business do
      name "Ramada"
      category_id 1
    end

    factory :park_business do
      name "Cherry" 
      category_id 2
    end
  end
end
