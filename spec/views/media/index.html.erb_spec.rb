require 'rails_helper'

RSpec.describe "media/index", type: :view do
  before(:each) do
    assign(:media, [
      Medium.create!(
        :image_url => "Image Url",
        :instagram_url => "Instagram Url",
        :flick_url => "Flick Url",
        :facebook_url => "Facebook Url",
        :audio_url => "Audio Url",
        :soundcloud_url => "Soundcloud Url",
        :video_url => "Video Url",
        :youtube_url => "Youtube Url",
        :vimeo_url => "Vimeo Url",
        :title => "Title",
        :description => "Description",
        :creator_name => "Creator Name",
        :creator_url => "Creator Url",
        :private => false,
        :user_id => 1
      ),
      Medium.create!(
        :image_url => "Image Url",
        :instagram_url => "Instagram Url",
        :flick_url => "Flick Url",
        :facebook_url => "Facebook Url",
        :audio_url => "Audio Url",
        :soundcloud_url => "Soundcloud Url",
        :video_url => "Video Url",
        :youtube_url => "Youtube Url",
        :vimeo_url => "Vimeo Url",
        :title => "Title",
        :description => "Description",
        :creator_name => "Creator Name",
        :creator_url => "Creator Url",
        :private => false,
        :user_id => 1
      )
    ])
  end

  it "renders a list of media" do
    render
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "Instagram Url".to_s, :count => 2
    assert_select "tr>td", :text => "Flick Url".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook Url".to_s, :count => 2
    assert_select "tr>td", :text => "Audio Url".to_s, :count => 2
    assert_select "tr>td", :text => "Soundcloud Url".to_s, :count => 2
    assert_select "tr>td", :text => "Video Url".to_s, :count => 2
    assert_select "tr>td", :text => "Youtube Url".to_s, :count => 2
    assert_select "tr>td", :text => "Vimeo Url".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Creator Name".to_s, :count => 2
    assert_select "tr>td", :text => "Creator Url".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
