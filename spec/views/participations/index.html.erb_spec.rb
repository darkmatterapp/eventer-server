require 'rails_helper'

RSpec.describe "participations/index", type: :view do
  before(:each) do
    assign(:participations, [
      Participation.create!(
        :session => nil,
        :participant => nil,
        :role => nil,
        :event => nil
      ),
      Participation.create!(
        :session => nil,
        :participant => nil,
        :role => nil,
        :event => nil
      )
    ])
  end

  it "renders a list of participations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
