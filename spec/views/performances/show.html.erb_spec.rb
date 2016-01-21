require 'rails_helper'

RSpec.describe "performances/show", type: :view do
  before(:each) do
    @performance = assign(:performance, Performance.create!(
      :name => "MyText",
      :description => "MyText",
      :event_id => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
