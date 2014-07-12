require 'spec_helper'

describe User do
  it "it is valid with an email and password" do
  	user = create(:user)
  	expect(user).to be_valid
  end

  it "is invalid without an email" do
  	expect(User.new(email: nil)).to have(1).errors_on(:email)
  end

  it "is invalid without a password" do
  	expect(User.new(password: nil)).to have(1).errors_on(:password)
  end

  it "is invalid with a password that is not 8 characters" do
  	expect(User.new(email: "jon@jon.com", password: "1234567")).to have(1).errors_on(:password)
  end
end
