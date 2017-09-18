module SessionsHelper
  def session_options_for_select(event, selected=nil)
    options_for_select event.sessions.all.map{ |p| [p.name, p.id] }, selected
  end
end
