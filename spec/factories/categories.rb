# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.department }
  end

  factory :invalid_category do
  	name nil
  end

  factory :default_category do
  	name "Hotel"
  end
end
