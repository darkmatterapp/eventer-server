require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :name => "MyString",
      :photo => "MyText",
      :bio => "MyText",
      :url => "MyText",
      :twitter => "MyString",
      :instagram => "MyString",
      :youtube => "MyString",
      :vimeo => "MyString",
      :bandcamp => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input#person_name[name=?]", "person[name]"

      assert_select "textarea#person_photo[name=?]", "person[photo]"

      assert_select "textarea#person_bio[name=?]", "person[bio]"

      assert_select "textarea#person_url[name=?]", "person[url]"

      assert_select "input#person_twitter[name=?]", "person[twitter]"

      assert_select "input#person_instagram[name=?]", "person[instagram]"

      assert_select "input#person_youtube[name=?]", "person[youtube]"

      assert_select "input#person_vimeo[name=?]", "person[vimeo]"

      assert_select "input#person_bandcamp[name=?]", "person[bandcamp]"
    end
  end
end
