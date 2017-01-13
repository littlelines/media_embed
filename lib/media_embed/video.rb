module MediaEmbed
  class Video

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

