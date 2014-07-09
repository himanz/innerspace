require 'spec_helper'

describe Category do
  it "is a valid category with a name" do
  	category = create(:category)
  	expect(category).to be_valid
  end

  it "is invalid without a name" do
  	expect(Category.new(name: nil)	).to have(1).errors_on(:name)
  end
end
