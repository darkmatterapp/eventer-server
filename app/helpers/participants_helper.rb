module ParticipantsHelper
  def participant_options_for_select(event, selected=nil)
    options_for_select event.participants.all.map{ |p| [p.name, p.id] }, selected
  end

  def link_to_participants(participants)
    links = []
    participants.each do |participant|
      links << link_to(participant.name, [:admin, @event, participant])
    end
    links.join(", ").html_safe
  end
end
