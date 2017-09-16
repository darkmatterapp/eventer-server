require 'rails_helper'

RSpec.describe "rsvps/edit", type: :view do
  before(:each) do
    @rsvp = assign(:rsvp, Rsvp.create!(
      :participant => nil,
      :yes => false,
      :no => false,
      :maybe => false,
      :content => "MyText",
      :event => nil
    ))
  end

  it "renders the edit rsvp form" do
    render

    assert_select "form[action=?][method=?]", rsvp_path(@rsvp), "post" do

      assert_select "input#rsvp_participant_id[name=?]", "rsvp[participant_id]"

      assert_select "input#rsvp_yes[name=?]", "rsvp[yes]"

      assert_select "input#rsvp_no[name=?]", "rsvp[no]"

      assert_select "input#rsvp_maybe[name=?]", "rsvp[maybe]"

      assert_select "textarea#rsvp_content[name=?]", "rsvp[content]"

      assert_select "input#rsvp_event_id[name=?]", "rsvp[event_id]"
    end
  end
end
