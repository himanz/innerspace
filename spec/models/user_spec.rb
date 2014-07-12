require 'spec_helper'

describe User do
  it "it is valid with a name and password" do
  	user = create(:user)
  	expect(user).to be_valid
  end
end
