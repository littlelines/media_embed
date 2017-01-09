module MediaEmbed
  module PrivateAttrAccessors

    def private_attr_accessor(*accessors)
      private
      attr_accessor *accessors
    end

  end
end
