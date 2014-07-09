# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  sequence :name do |n| 
  	"Bar#{n}" 
  end
  
  factory :category do
    name { FactoryGirl.generate(:name) }

    factory :invalid_category do
  	  name nil
    end

    factory :default_category do
  	  name "Hotel"
    end

    
  end

  
end
