module PeopleHelper
  def person_options_for_select(event, selected=nil)
    options_for_select event.people.all.map{ |e| [e.name, e.id] }, selected
  end

  def link_to_people(people)
    links = []
    people.each do |person|
      links << link_to(person.name, [@event, person])
    end
    links.join(", ").html_safe
  end
end
