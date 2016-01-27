class Medium < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  def name
    [
      title,
      namify_url(image_url),
      namify_url(audio_url),
      namify_url(vimeo_url),
      namify_url(instagram_url),
      namify_url(flickr_url),
      namify_url(facebook_url),
      namify_url(soundcloud_url),
      namify_url(video_url),
      namify_url(youtube_url),
      namify_url(vine_url),
      id
    ].map{ |l| l unless l.blank? }.compact.first
  end

  def namify_url(url)
    if url.nil?
      nil
    else
      if url.split("/").last.nil?
        nil
      else
        url.split("/").last.split(".").first
      end
    end
  end
end
