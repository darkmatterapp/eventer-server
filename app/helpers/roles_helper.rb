module RolesHelper
  def role_options_for_select(event, selected=nil)
    options_for_select event.roles.all.map{ |r| [r.name, r.id] }, selected
  end
end
