module MediaEmbed
  class OptionsHandler

    attr_accessor :prioritized_options, :remaining_options

    def initialize(prioritized_options_name, options_hash)
      @prioritized_options_name = prioritized_options_name
      @options_hash =  options_hash

      split_options
      override_duplicate_remaining_options
    end

    def consolidate_options
      prioritized_options.merge(remaining_options)
    end

    private

    def split_options
      self.remaining_options = @options_hash.dup
      self.prioritized_options = remaining_options.delete(@prioritized_options_name) || {}
    end

    def override_duplicate_remaining_options
      remaining_options.reject! do |option_name, _|
        prioritized_options.keys.include?(option_name)
      end
    end

  end
end
