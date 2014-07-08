require 'spec_helper'

describe Category do
  it "is a valid category with a name" do
  	category = create(:category)
  	expect(category).to be_valid
  end
end
