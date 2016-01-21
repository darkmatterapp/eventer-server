require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :name => "Name",
      :photo => "MyText",
      :bio => "MyText",
      :url => "MyText",
      :twitter => "Twitter",
      :instagram => "Instagram",
      :youtube => "Youtube",
      :vimeo => "Vimeo",
      :bandcamp => "Bandcamp"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Instagram/)
    expect(rendered).to match(/Youtube/)
    expect(rendered).to match(/Vimeo/)
    expect(rendered).to match(/Bandcamp/)
  end
end
