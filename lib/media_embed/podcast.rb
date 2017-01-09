module MediaEmbed
  class Podcast
    SOUNDCLOUD_WHITELIST_PARAMS = [
      :auto_play,
      :buying,
      :liking,
      :download,
      :sharing,
      :show_artwork,
      :show_comments,
      :show_playcount,
      :show_user,
      :start_track
    ]

    def self.soundcloud_template(code, options = {})
      %Q(<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//soundcloud.com/#{code}&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>)
    end
  end
end
