require 'rails_helper'

RSpec.describe "media/show", type: :view do
  before(:each) do
    @medium = assign(:medium, Medium.create!(
      :image_url => "Image Url",
      :instagram_url => "Instagram Url",
      :flickr_url => "Flick Url",
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/Instagram Url/)
    expect(rendered).to match(/Flick Url/)
    expect(rendered).to match(/Facebook Url/)
    expect(rendered).to match(/Audio Url/)
    expect(rendered).to match(/Soundcloud Url/)
    expect(rendered).to match(/Video Url/)
    expect(rendered).to match(/Youtube Url/)
    expect(rendered).to match(/Vimeo Url/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Creator Name/)
    expect(rendered).to match(/Creator Url/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
  end
end
