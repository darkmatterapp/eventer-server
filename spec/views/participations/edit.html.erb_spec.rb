require 'rails_helper'

RSpec.describe "participations/edit", type: :view do
  before(:each) do
    @participation = assign(:participation, Participation.create!(
      :performance => nil,
      :person => nil,
      :role => nil,
      :event => nil
    ))
  end

  it "renders the edit participation form" do
    render

    assert_select "form[action=?][method=?]", participation_path(@participation), "post" do

      assert_select "input#participation_performance_id[name=?]", "participation[performance_id]"

      assert_select "input#participation_person_id[name=?]", "participation[person_id]"

      assert_select "input#participation_role_id[name=?]", "participation[role_id]"

      assert_select "input#participation_event_id[name=?]", "participation[event_id]"
    end
  end
end
