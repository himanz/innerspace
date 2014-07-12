# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email "jon@jon.com"
  	password "123456"
  	password_confirmation "123456"

  	factory :invalid_user do
  		email nil
  	end

  	factory :default_user do
  		email "default@default.com"
  		password "default"
  		password_confirmation "default"
  	end
  end
end
