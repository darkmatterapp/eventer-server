module PerformancesHelper
  def performance_options_for_select(event, selected=nil)
    options_for_select event.performances.all.map{ |p| [p.name, p.id] }, selected
  end
end
