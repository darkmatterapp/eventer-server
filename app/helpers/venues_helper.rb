module VenuesHelper
  def geo_url_for(latitude, longitude)
    "geo:#{latitude},#{longitude}"
  end

  def convert_to_sexagesimal(decimal)
    # logic from http://mathforum.org/sarah/hamilton/ham.degrees.html
    # based on @mando's gist https://gist.github.com/mando/c33cb129af8f2f57cf25
    degrees = decimal.to_i
    minutes = ((degrees - degrees) * 60).abs.to_i
    seconds = ((minutes - minutes.to_int) * 60).abs.round(2)

    %Q{#{degrees}&#176; #{minutes}' #{seconds}"}.html_safe
  end
end
