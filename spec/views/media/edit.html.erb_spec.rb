require 'rails_helper'

RSpec.describe "media/edit", type: :view do
  before(:each) do
    @medium = assign(:medium, Medium.create!(
      :image_url => "MyString",
      :instagram_url => "MyString",
      :flick_url => "MyString",
      :facebook_url => "MyString",
      :audio_url => "MyString",
      :soundcloud_url => "MyString",
      :video_url => "MyString",
      :youtube_url => "MyString",
      :vimeo_url => "MyString",
      :title => "MyString",
      :description => "MyString",
      :creator_name => "MyString",
      :creator_url => "MyString",
      :private => false,
      :user_id => 1
    ))
  end

  it "renders the edit medium form" do
    render

    assert_select "form[action=?][method=?]", medium_path(@medium), "post" do

      assert_select "input#medium_image_url[name=?]", "medium[image_url]"

      assert_select "input#medium_instagram_url[name=?]", "medium[instagram_url]"

      assert_select "input#medium_flick_url[name=?]", "medium[flick_url]"

      assert_select "input#medium_facebook_url[name=?]", "medium[facebook_url]"

      assert_select "input#medium_audio_url[name=?]", "medium[audio_url]"

      assert_select "input#medium_soundcloud_url[name=?]", "medium[soundcloud_url]"

      assert_select "input#medium_video_url[name=?]", "medium[video_url]"

      assert_select "input#medium_youtube_url[name=?]", "medium[youtube_url]"

      assert_select "input#medium_vimeo_url[name=?]", "medium[vimeo_url]"

      assert_select "input#medium_title[name=?]", "medium[title]"

      assert_select "input#medium_description[name=?]", "medium[description]"

      assert_select "input#medium_creator_name[name=?]", "medium[creator_name]"

      assert_select "input#medium_creator_url[name=?]", "medium[creator_url]"

      assert_select "input#medium_private[name=?]", "medium[private]"

      assert_select "input#medium_user_id[name=?]", "medium[user_id]"
    end
  end
end
