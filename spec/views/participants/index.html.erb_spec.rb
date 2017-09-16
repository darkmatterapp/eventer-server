require 'rails_helper'

RSpec.describe "participants/index", type: :view do
  before(:each) do
    assign(:participants, [
      Participant.create!(
        :name => "Name",
        :photo => "MyText",
        :bio => "MyText",
        :url => "MyText",
        :twitter => "Twitter",
        :instagram => "Instagram",
        :youtube => "Youtube",
        :vimeo => "Vimeo",
        :bandcamp => "Bandcamp"
      ),
      Participant.create!(
        :name => "Name",
        :photo => "MyText",
        :bio => "MyText",
        :url => "MyText",
        :twitter => "Twitter",
        :instagram => "Instagram",
        :youtube => "Youtube",
        :vimeo => "Vimeo",
        :bandcamp => "Bandcamp"
      )
    ])
  end

  it "renders a list of participants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Instagram".to_s, :count => 2
    assert_select "tr>td", :text => "Youtube".to_s, :count => 2
    assert_select "tr>td", :text => "Vimeo".to_s, :count => 2
    assert_select "tr>td", :text => "Bandcamp".to_s, :count => 2
  end
end
