# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email "jon@jon.com"
  	password "12345678"
    first_name "Jonathan"
    last_name "Chang"

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

    # for testing facebook login
  	# factory :facebook_user do
	  # 	provider 'facebook'
		 #  uid 'facebook-user-id'
  	# end
  end
end
