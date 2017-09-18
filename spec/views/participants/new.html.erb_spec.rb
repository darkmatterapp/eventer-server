require 'rails_helper'

RSpec.describe "participants/new", type: :view do
  before(:each) do
    assign(:participant, Participant.new(
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

  it "renders new participant form" do
    render

    assert_select "form[action=?][method=?]", participants_path, "post" do

      assert_select "input#participant_name[name=?]", "participant[name]"

      assert_select "textarea#participant_photo[name=?]", "participant[photo]"

      assert_select "textarea#participant_bio[name=?]", "participant[bio]"

      assert_select "textarea#participant_url[name=?]", "participant[url]"

      assert_select "input#participant_twitter[name=?]", "participant[twitter]"

      assert_select "input#participant_instagram[name=?]", "participant[instagram]"

      assert_select "input#participant_youtube[name=?]", "participant[youtube]"

      assert_select "input#participant_vimeo[name=?]", "participant[vimeo]"

      assert_select "input#participant_bandcamp[name=?]", "participant[bandcamp]"
    end
  end
end
