module MediaEmbed
  class Podcast

    def self.soundcloud_template(code, options = {})
      source = "https://w.soundcloud.com/player?url=https%3A//soundcloud.com/#{code}"

      builder = IframeBuilder.new(source, options, SOUNDCLOUD_SRC_WHITELIST)

      builder.build
    end

  end
end
