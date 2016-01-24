require "open-uri"
require "json"

module PhotosHelper
  def flickr_embed(flickr_url)
    oembed_url = "https://www.flickr.com/services/oembed?url=" +
                 flickr_url +
                 "&amp;format=xml"

    result = Nokogiri::XML(open(oembed_url))
    result.css("html").text.html_safe
  end
end
