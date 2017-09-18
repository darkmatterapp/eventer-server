require 'rails_helper'

RSpec.describe "sessions/new", type: :view do
  before(:each) do
    assign(:session, Session.new(
      :name => "MyText",
      :description => "MyText",
      :event_id => 1,
      :user_id => 1
    ))
  end

  it "renders new session form" do
    render

    assert_select "form[action=?][method=?]", sessions_path, "post" do

      assert_select "textarea#session_name[name=?]", "session[name]"

      assert_select "textarea#session_description[name=?]", "session[description]"

      assert_select "input#session_event_id[name=?]", "session[event_id]"

      assert_select "input#session_user_id[name=?]", "session[user_id]"
    end
  end
end
