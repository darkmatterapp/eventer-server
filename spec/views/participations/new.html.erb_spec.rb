require 'rails_helper'

RSpec.describe "participations/new", type: :view do
  before(:each) do
    assign(:participation, Participation.new(
      :performance => nil,
      :person => nil,
      :role => nil,
      :event => nil
    ))
  end

  it "renders new participation form" do
    render

    assert_select "form[action=?][method=?]", participations_path, "post" do

      assert_select "input#participation_performance_id[name=?]", "participation[performance_id]"

      assert_select "input#participation_person_id[name=?]", "participation[person_id]"

      assert_select "input#participation_role_id[name=?]", "participation[role_id]"

      assert_select "input#participation_event_id[name=?]", "participation[event_id]"
    end
  end
end
