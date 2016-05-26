module MediaEmbed
  class Video
    def self.youtube_template(code)
      source = "http://youtube.com/embed/#{code}"

      return iframe_structure(source)
    end

    def self.vimeo_template(code)
      source = "//player.vimeo.com/video/#{code}"

      return iframe_structure(source, ['webkitallowfullscreen', 'mozallowfullscreen'])
    end

    private

    def self.iframe_structure(source, options = [])
      "<iframe src='#{source}' frameborder='0' #{options.join(' ')} allowfullscreen></iframe>"
    end
  end
end
