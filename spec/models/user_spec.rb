require 'spec_helper'

describe User do
  it "it is valid with an email and password" do
  	user = create(:user)
  	expect(user).to be_valid
  end

  it "is invalid without an email " do
  	expect(User.new(email: nil)).to have(1).errors_on(:email)
  end
end
