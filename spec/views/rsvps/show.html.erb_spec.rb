require 'rails_helper'

RSpec.describe "rsvps/show", type: :view do
  before(:each) do
    @rsvp = assign(:rsvp, Rsvp.create!(
      :person => nil,
      :yes => false,
      :no => false,
      :maybe => false,
      :content => "MyText",
      :event => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
