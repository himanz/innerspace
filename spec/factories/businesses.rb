# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :business do
    name { Faker::Company.name }
    address { Faker::Address.street_address }

    factory :invalid_business do
  	  name nil
    end

    factory :default do
    	name "Default Cafe"
    	address "1 Default Drive"
    end
  end
end
