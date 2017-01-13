require 'test_helper'
require 'media_embed/podcast'

class PodcastTest < Minitest::Test

  test 'it should call to the IframeBuilder with soundcloud source and soundcloud src whitelist' do
    source = 'https://w.soundcloud.com/player?url=https%3A//soundcloud.com/1234'
    options = {}
    whitelist = MediaEmbed::SOUNDCLOUD_SRC_WHITELIST

    builder = MediaEmbed::IframeBuilder.new(source, options, whitelist)

    MediaEmbed::IframeBuilder.expects(:new).with(source, options, whitelist).returns(builder)

    MediaEmbed::Podcast.soundcloud_template('1234')
  end

end
