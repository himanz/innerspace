require 'spec_helper'

describe Business do
  it "is valid with a name, address, heading and pano" do
  	business = create(:business)
  	expect(business).to be_valid
  end

  it "is invalid without a name" do
  	expect(Business.new(name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without an address" do
  	expect(Business.new(address: nil)).to have(1).errors_on(:address)
  end

  it "is invalid without a heading" do
  	expect(Business.new(heading: nil)).to have(1).errors_on(:heading)
  end
  it "is invalid without a pano" do
  	expect(Business.new(pano: nil)).to have(1).errors_on(:pano)
  end
end
