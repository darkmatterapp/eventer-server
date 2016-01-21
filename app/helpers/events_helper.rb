module EventsHelper
  def event_options_for_select
    current_user.events.all.map{ |e| [e.name, e.id] }
  end
end
