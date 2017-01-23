module MediaEmbed
  class IframeBuilder
    IFRAME_ATTRS_WHITELIST = [ :align, :frameborder, :height,
      :marginheight, :marginwidth, :name, :width, :allowfullscreen,
      :webkitallowfullscreen, :mozallowfullscreen ]

    NO_VALUE_OPTIONS = [
      :allowfullscreen,
      :webkitallowfullscreen,
      :mozallowfullscreen
    ]

    attr_accessor :url_options, :iframe_options

    def initialize(source, options = {}, url_params_whitelist = [])
      @source = source
      @options = Hash[options.map { |key, val| [key.to_sym, val] }]
      @url_params_whitelist = url_params_whitelist

      split_options
    end

    def build
      %(<iframe src="#{@source}#{url_params_string}"#{iframe_options_string}></iframe>)
    end

    # private

    def url_params_string
      "?#{url_options.map { |name, value| "#{name}=#{value}" }.join('&')}" if url_options.any?
    end

    def iframe_options_string
      return unless iframe_options.any?

      key_value_options = iframe_options.reject { |opt_name, _| NO_VALUE_OPTIONS.include?(opt_name) }

      options_string = " #{key_value_options.map { |name, value| "#{name}=\"#{value}\"" }.join(' ')}"

      if NO_VALUE_OPTIONS.any? { |opt| iframe_options.keys.include? opt }
        options_string = "#{options_string}#{NO_VALUE_OPTIONS.map { |opt| iframe_options[opt] ? opt.to_s : nil }.compact.join(' ')}"
      end

      options_string
    end

    def split_options
      self.iframe_options = @options.select { |key, _| IFRAME_ATTRS_WHITELIST.include?(key) }
      self.url_options = @options.select { |key, _| @url_params_whitelist.include?(key) }
    end

  end
end
