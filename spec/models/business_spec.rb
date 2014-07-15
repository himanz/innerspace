require 'spec_helper'

describe Business do
  it "is valid with a name, address, heading, pano, category_id, latitude and longitude" do
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

  it "is invalid without a latitude" do
    expect(Business.new(latitude: nil)).to have(1).errors_on(:latitude)
  end

  it "is invalid without a longitude" do
    expect(Business.new(longitude: nil)).to have(1).errors_on(:longitude)
  end

  it "returns a valid streetview static image link" do
    business = create(:business)
    expect(business.streetview_image).to eq "http://maps.googleapis.com/maps/api/streetview?size=500x300&heading=200.0&pitch=0&pano=3L5NCiIf__oAAAQIt-clrA&sensor=false&key=#{ENV['google_maps_api_key']}"
  end

  it "returns a valid streetview tour link" do
    business = create(:business)
    expect(business.streetview_tour).to eq "https://maps.google.ca/maps?hl=en_uk&ll=45.342201,-79.142333&layer=c&panoid=3L5NCiIf__oAAAQIt-clrA&cbp=,191.0,,0,-0.0&t=m&z=17&source=embed&output=svembed"
  end
end
