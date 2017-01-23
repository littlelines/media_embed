require "media_embed/version"
require "media_embed/railtie" if defined? Rails

require "media_embed/iframe_builder"
require "media_embed/handler"
require "media_embed/video"
require "media_embed/podcast"

module MediaEmbed
end
