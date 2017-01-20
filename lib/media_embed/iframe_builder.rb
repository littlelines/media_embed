module MediaEmbed
  class IframeBuilder
    extend PrivateAttrAccessors

    IFRAME_ATTRS_WHITELIST = [ :align, :frameborder, :height,
      :marginheight, :marginwidth, :name, :width, :allowfullscreen,
      :webkitallowfullscreen, :mozallowfullscreen ]

    private_attr_accessor :url_options, :iframe_options

    def initialize(source, options = {}, url_params_whitelist = [])
      @source = source
      @options = Hash[options.map { |key, val| [key.to_sym, val] }]
      @url_params_whitelist = url_params_whitelist

      split_options
    end

    def build
      %(<iframe src="#{@source}#{url_params_string}"#{iframe_options_string}></iframe>)
    end

    private

    def url_params_string
      "?#{url_options.map { |name, value| "#{name}=#{value}" }.join('&')}" if url_options.any?
    end

    def iframe_options_string
      " #{iframe_options.map { |name, value| "#{name}=\"#{value}\"" }.join(' ')}" if iframe_options.any?
    end

    def split_options
      self.iframe_options = @options.select { |key, _| IFRAME_ATTRS_WHITELIST.include?(key) }
      self.url_options = @options.select { |key, _| @url_params_whitelist.include?(key) }
    end

  end
end
