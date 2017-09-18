require 'rails_helper'

RSpec.describe "participations/show", type: :view do
  before(:each) do
    @participation = assign(:participation, Participation.create!(
      :session => nil,
      :participant => nil,
      :role => nil,
      :event => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
