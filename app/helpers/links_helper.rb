module LinksHelper
  def link_to_social(site, username)
    if site == :bandcamp
      url = "https://#{username}.#{site}.com"
    else
      url = "https://#{site}.com/#{username}"
    end
    
    link_to username, url, class: "u-url", target: "_blank"
  end
  
  def human_readable_url(url)
    url.gsub(/^.*:\/\//, "").gsub(/^www\./, "").gsub(/\/$/, "")
  end
end