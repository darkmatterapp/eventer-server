require 'rails_helper'

RSpec.describe "rsvps/new", type: :view do
  before(:each) do
    assign(:rsvp, Rsvp.new(
      :person => nil,
      :yes => false,
      :no => false,
      :maybe => false,
      :content => "MyText",
      :event => nil
    ))
  end

  it "renders new rsvp form" do
    render

    assert_select "form[action=?][method=?]", rsvps_path, "post" do

      assert_select "input#rsvp_person_id[name=?]", "rsvp[person_id]"

      assert_select "input#rsvp_yes[name=?]", "rsvp[yes]"

      assert_select "input#rsvp_no[name=?]", "rsvp[no]"

      assert_select "input#rsvp_maybe[name=?]", "rsvp[maybe]"

      assert_select "textarea#rsvp_content[name=?]", "rsvp[content]"

      assert_select "input#rsvp_event_id[name=?]", "rsvp[event_id]"
    end
  end
end
