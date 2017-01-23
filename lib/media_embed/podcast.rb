module MediaEmbed
  class Podcast

    SOUNDCLOUD_SRC_WHITELIST = [ :auto_play, :buying, :liking,
      :download, :sharing, :show_artwork, :show_comments, :show_playcount,
      :show_user, :start_track ]

    def self.soundcloud_template(code, options = {})
      source = "https://w.soundcloud.com/player?url=https%3A//soundcloud.com/#{code}"

      builder = IframeBuilder.new(
        source,
        consolidated_options(:soundcloud, options),
        SOUNDCLOUD_SRC_WHITELIST
      )

      builder.build
    end

    def self.consolidated_options(service, options)
      handler = OptionsHandler.new(service, options)

      return handler.consolidate_options
    end

  end
end
