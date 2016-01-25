require 'rails_helper'

RSpec.describe "venues/show", type: :view do
  before(:each) do
    @venue = assign(:venue, Venue.create!(
      :name => "Name",
      :nickname => "Nickname",
      :street_address => "Street Address",
      :extended_address => "Extended Address",
      :locality => "Locality",
      :region => "Region",
      :postal_code => "Postal Code",
      :country => "Country",
      :phone => "Phone",
      :url => "MyText",
      :latitude => "Latitude",
      :longitude => "Longitude",
      :altitude => "Altitude"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/Extended Address/)
    expect(rendered).to match(/Locality/)
    expect(rendered).to match(/Region/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Latitude/)
    expect(rendered).to match(/Longitude/)
    expect(rendered).to match(/Altitude/)
  end
end
