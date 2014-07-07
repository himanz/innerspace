# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :business do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
  end
end
