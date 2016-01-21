require 'rails_helper'

RSpec.describe "performances/new", type: :view do
  before(:each) do
    assign(:performance, Performance.new(
      :name => "MyText",
      :description => "MyText",
      :event_id => 1,
      :user_id => 1
    ))
  end

  it "renders new performance form" do
    render

    assert_select "form[action=?][method=?]", performances_path, "post" do

      assert_select "textarea#performance_name[name=?]", "performance[name]"

      assert_select "textarea#performance_description[name=?]", "performance[description]"

      assert_select "input#performance_event_id[name=?]", "performance[event_id]"

      assert_select "input#performance_user_id[name=?]", "performance[user_id]"
    end
  end
end
