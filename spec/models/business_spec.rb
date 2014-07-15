require 'spec_helper'

describe Business do
  it "is valid with a name, address, heading, pano and category_id" do
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

  it "returns a valid streetview static image link" do
    business = create(:business)
    expect(business.streetview_image).to eq "http://maps.googleapis.com/maps/api/streetview?size=500x300&heading=200.0&pitch=0&pano=3L5NCiIf__oAAAQIt-clrA&sensor=false&key=#{ENV['google_maps_api_key']}"
  end
end
