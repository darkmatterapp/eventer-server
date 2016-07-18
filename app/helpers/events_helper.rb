module EventsHelper
  def event_options_for_select
    current_user.events.all.map{ |e| [e.name, e.id] }
  end

  def jump_to_tag(section=nil)
    anchor = section.downcase.sub('/', '-')

    link_to "##{anchor}",
            class: "btn btn-primary btn-sm btn-jump visible-xs-block",
            data: { turbolinks: "false" } do
      "JUMP TO #{content_tag :b, section} SECTION".html_safe
    end
  end
end
