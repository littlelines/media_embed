require "media_embed/version"
require "media_embed/railtie" if defined? Rails
require "media_embed/private_attr_accessors"

require "media_embed/iframe_builder"
require "media_embed/handler"
require "media_embed/video"
require "media_embed/podcast"

module MediaEmbed
  YOUTUBE_SRC_WHITELIST = [ :autoplay,
                            :cc_load_policy,
                            :color,
                            :controls,
                            :disablekb,
                            :enablejsapi,
                            :end,
                            :fs,
                            :h1,
                            :iv_load_policy,
                            :list,
                            :listType,
                            :loop,
                            :modestbranding,
                            :origin,
                            :playlist,
                            :playsinline,
                            :rel,
                            :showinfo,
                            :start
                          ]

  VIMEO_SRC_WHITELIST = [ :autopause,
                          :autoplay,
                          :badge,
                          :byline,
                          :color,
                          :loop,
                          :player_id,
                          :portrait,
                          :title
                        ]

  # SOUNDCLOUD_SRC_WHITELIST

end
