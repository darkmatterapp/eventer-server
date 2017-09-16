require 'rails_helper'

RSpec.describe "participations/new", type: :view do
  before(:each) do
    assign(:participation, Participation.new(
      :session => nil,
      :participant => nil,
      :role => nil,
      :event => nil
    ))
  end

  it "renders new participation form" do
    render

    assert_select "form[action=?][method=?]", participations_path, "post" do

      assert_select "input#participation_session_id[name=?]", "participation[session_id]"

      assert_select "input#participation_participant_id[name=?]", "participation[participant_id]"

      assert_select "input#participation_role_id[name=?]", "participation[role_id]"

      assert_select "input#participation_event_id[name=?]", "participation[event_id]"
    end
  end
end
