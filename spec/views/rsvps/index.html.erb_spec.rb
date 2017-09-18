require 'rails_helper'

RSpec.describe "rsvps/index", type: :view do
  before(:each) do
    assign(:rsvps, [
      Rsvp.create!(
        :participant => nil,
        :yes => false,
        :no => false,
        :maybe => false,
        :content => "MyText",
        :event => nil
      ),
      Rsvp.create!(
        :participant => nil,
        :yes => false,
        :no => false,
        :maybe => false,
        :content => "MyText",
        :event => nil
      )
    ])
  end

  it "renders a list of rsvps" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
