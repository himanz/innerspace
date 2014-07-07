require 'spec_helper'

describe Business do
  it "is valid with a name and address" do
  	business = Business.new(
  		name: 'Pho Paradise',
  		address: '100 McCowan Road')
  	expect(business).to be_valid
  end

  it "is invalid without a name" do
  	expect(Business.new(name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without an address" do
  	expect(Business.new(address: nil)).to have(1).errors_on(:address)
  end
end
