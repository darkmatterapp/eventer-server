require 'rails_helper'

RSpec.describe "venues/index", type: :view do
  before(:each) do
    assign(:venues, [
      Venue.create!(
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
      ),
      Venue.create!(
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
      )
    ])
  end

  it "renders a list of venues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "Extended Address".to_s, :count => 2
    assert_select "tr>td", :text => "Locality".to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
    assert_select "tr>td", :text => "Altitude".to_s, :count => 2
  end
end
