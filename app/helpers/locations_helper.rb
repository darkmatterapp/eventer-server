module LocationsHelper
  def location_options_for_select(event)
    locations = []

    event.venues.each do |venue|
      venue.locations.each do |location|
        locations << location
      end
    end

    locations.map do |l|
      [
        [l.venue.name, l.name].join(" : "), l.id
      ]
    end
  end
end
