require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      :name => "MyString",
      :nickname => "MyString",
      :street_address => "MyString",
      :extended_address => "MyString",
      :locality => "MyString",
      :region => "MyString",
      :postal_code => "MyString",
      :country => "MyString",
      :phone => "MyString",
      :url => "MyText",
      :latitude => "MyString",
      :longitude => "MyString",
      :altitude => "MyString"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_name[name=?]", "location[name]"

      assert_select "input#location_nickname[name=?]", "location[nickname]"

      assert_select "input#location_street_address[name=?]", "location[street_address]"

      assert_select "input#location_extended_address[name=?]", "location[extended_address]"

      assert_select "input#location_locality[name=?]", "location[locality]"

      assert_select "input#location_region[name=?]", "location[region]"

      assert_select "input#location_postal_code[name=?]", "location[postal_code]"

      assert_select "input#location_country[name=?]", "location[country]"

      assert_select "input#location_phone[name=?]", "location[phone]"

      assert_select "textarea#location_url[name=?]", "location[url]"

      assert_select "input#location_latitude[name=?]", "location[latitude]"

      assert_select "input#location_longitude[name=?]", "location[longitude]"

      assert_select "input#location_altitude[name=?]", "location[altitude]"
    end
  end
end
