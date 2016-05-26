module MediaEmbed
  module Handler
    CODE = -1

    def embed(url)
      return template_for(url)
    end

    def template_for(url)
      template = if match = youtube?(url)
                   Video.youtube_template(match[CODE])
                 elsif match = vimeo?(url)
                   Video.vimeo_template(match[CODE])
                 else
                   ''
                 end

      return template
    end


    def youtube?(url)
      url.match youtube_regex
    end

    def vimeo?(url)
      url.match vimeo_regex
    end

    def youtube_regex
      /youtu(\.be|be\.com)\/(watch\?v=|embed\/|)([^?\s]*)/
    end

    def vimeo_regex
      /vimeo\.com\/(channels\/\D*|groups\/\D*|album\/\d*\/video\/|video\/|)([^?\s]*)/
    end
  end
end

