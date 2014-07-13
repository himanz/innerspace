# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email "jon@jon.com"
  	password "12345678"

  	factory :invalid_user do
  		email nil
  	end

  	factory :default_user do
  		email "default@default.com"
  		password "12345678"
  	end

  	factory :admin_user do
  		email "admin@admin.com"
  		admin true
  	end

  	trait :with_facebook_account do
  		after(:create) do |user|
	  		create(:user_account, :facebook, user: user)
	  	end
  	end
  end
end
