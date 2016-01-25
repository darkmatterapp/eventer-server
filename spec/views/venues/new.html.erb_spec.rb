require 'rails_helper'

RSpec.describe "venues/new", type: :view do
  before(:each) do
    assign(:venue, Venue.new(
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

  it "renders new venue form" do
    render

    assert_select "form[action=?][method=?]", venues_path, "post" do

      assert_select "input#venue_name[name=?]", "venue[name]"

      assert_select "input#venue_nickname[name=?]", "venue[nickname]"

      assert_select "input#venue_street_address[name=?]", "venue[street_address]"

      assert_select "input#venue_extended_address[name=?]", "venue[extended_address]"

      assert_select "input#venue_locality[name=?]", "venue[locality]"

      assert_select "input#venue_region[name=?]", "venue[region]"

      assert_select "input#venue_postal_code[name=?]", "venue[postal_code]"

      assert_select "input#venue_country[name=?]", "venue[country]"

      assert_select "input#venue_phone[name=?]", "venue[phone]"

      assert_select "textarea#venue_url[name=?]", "venue[url]"

      assert_select "input#venue_latitude[name=?]", "venue[latitude]"

      assert_select "input#venue_longitude[name=?]", "venue[longitude]"

      assert_select "input#venue_altitude[name=?]", "venue[altitude]"
    end
  end
end
