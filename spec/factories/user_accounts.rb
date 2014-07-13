FactoryGirl.define do
	user

	provider 'facebook'
	uid 'facebook-user-id'

	trait :facebook do
		provider 'facebook'
	end
end