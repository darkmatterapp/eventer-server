module MediaHelper
  def media_embeds_for_type(type)
    embeds = {
      audio: %w(audio soundcloud),
      video: %w(video instagram flickr facebook youtube vimeo vine),
      photo: %w(image instagram flickr facebook)
    }

    embeds[type.downcase.to_sym]
  end

  def creator_photo_tag(resource)
    if resource.creator_photo.present?
      image_tag resource.creator_photo, alt: "#{resource.creator_name}'s profile photo", class: "u-photo"
    end
  end
end
