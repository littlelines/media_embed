module MediaEmbed
  class Video

    YOUTUBE_SRC_WHITELIST = [ :autoplay, :cc_load_policy, :color,
      :controls, :disablekb, :enablejsapi, :end, :fs, :h1, :iv_load_policy,
      :list, :listType, :loop, :modestbranding, :origin, :playlist,
      :playsinline, :rel, :showinfo, :start ]

    VIMEO_SRC_WHITELIST = [ :autopause, :autoplay, :badge, :byline,
      :color, :loop, :player_id, :portrait, :title ]

    def self.youtube_template(code, options = {})
      source = "//www.youtube.com/embed/#{code}"

      builder = IframeBuilder.new(
        source,
        consolidated_options(:youtube, options),
        YOUTUBE_SRC_WHITELIST
      )

      builder.build
    end

    def self.vimeo_template(code, options = {})
      source = "//player.vimeo.com/video/#{code}"

      builder = IframeBuilder.new(
        source,
        consolidated_options(:vimeo, options),
        VIMEO_SRC_WHITELIST
      )

      builder.build
    end

    def self.consolidated_options(service, options)
      OptionsHandler.new(service, options).consolidate_options
    end

  end
end

