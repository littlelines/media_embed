module MediaEmbed
  class Podcast

    SOUNDCLOUD_SRC_WHITELIST = [ :auto_play, :buying, :color, :default_height, :default_width,
      :download, :enable_api, :font, :sharing, :show_artwork, :show_bpm, :show_comments,
      :show_playcount, :show_user, :single_active, :start_track, :text_buy_set, :text_buy_track,
      :text_download_track, :theme_color ]

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

      return transform_synonymous_keys(handler.consolidate_options)
    end

    def self.transform_synonymous_keys(options)
      Hash[options.map { |k,v| [k == :autoplay ? :auto_play : k, v] }]
    end

  end
end
