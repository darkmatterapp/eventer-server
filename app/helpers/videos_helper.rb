require "open-uri"
require "json"

module VideosHelper
  def youtube_video_id(youtube_url)
    if youtube_url =~ /youtu\.be/
      URI.parse(youtube_url).path.gsub("/", "")
    else
      Hash[URI.parse(youtube_url).query.split("&").map{ |q| q.split("=") }]["v"]
    end
  end

  def vine_video_id(vine_url)
    URI.parse(vine_url).path.gsub("/v/", "")
  end

  def vimeo_embed(vimeo_url)
    oembed_url = "https://vimeo.com/api/oembed.json?url=" + vimeo_url

    result = JSON.parse(open(oembed_url).read)
    result["html"].html_safe
  end
end
