module MediaEmbed
  class Video

    YOUTUBE_SRC_WHITELIST = [ :autoplay, :cc_load_policy, :color,
      :controls, :disablekb, :enablejsapi, :end, :fs, :h1, :iv_load_policy,
      :list, :listType, :loop, :modestbranding, :origin, :playlist,
      :playsinline, :rel, :showinfo, :start ]

    VIMEO_SRC_WHITELIST = [ :autopause, :autoplay, :badge, :byline,
      :color, :loop, :player_id, :portrait, :title ]

    def self.youtube_template(code, options = {})
      builder = IframeBuilder.new("//www.youtube.com/embed/#{code}", options, YOUTUBE_SRC_WHITELIST)

      builder.build
    end

    def self.vimeo_template(code, options = {})
      builder = IframeBuilder.new("//player.vimeo.com/video/#{code}", options, VIMEO_SRC_WHITELIST)

      builder.build
    end

  end
end

