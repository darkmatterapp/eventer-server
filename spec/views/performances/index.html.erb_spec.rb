require 'rails_helper'

RSpec.describe "performances/index", type: :view do
  before(:each) do
    assign(:performances, [
      Performance.create!(
        :name => "MyText",
        :description => "MyText",
        :event_id => 1,
        :user_id => 2
      ),
      Performance.create!(
        :name => "MyText",
        :description => "MyText",
        :event_id => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of performances" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
