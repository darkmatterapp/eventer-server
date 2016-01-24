module MediaHelper
  def media_embeds_for_type(type)
    embeds = {
      audio: %w(audio soundcloud),
      video: %w(video instagram flickr facebook youtube vimeo vine),
      photo: %w(image instagram flickr facebook)
    }

    embeds[type.downcase.to_sym]
  end
end
