require "open-uri"
require "json"

module AudiosHelper
  def soundcloud_embed(soundcloud_url)
    oembed_url = "https://soundcloud.com/oembed?url=" +
                 soundcloud_url +
                 "&amp;format=json"

    result = JSON.parse(open(oembed_url).read)
    result["html"].html_safe
  end
end
