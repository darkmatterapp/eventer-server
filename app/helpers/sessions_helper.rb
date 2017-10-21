module SessionsHelper
  def active_session_options_for_select(event, selected=nil)
    options_for_select event.sessions.active.map{ |p| [p.name, p.id] }, selected
  end
end
