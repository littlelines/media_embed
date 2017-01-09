require 'test_helper'
require 'media_embed/video'

class VideoTest < Minitest::Test

  test 'it should call to the IframeBuilder with youtube source and youtube src whitelist' do
    source = '//www.youtube.com/embed/1234'
    options = {}
    whitelist = MediaEmbed::YOUTUBE_SRC_WHITELIST

    builder = MediaEmbed::IframeBuilder.new(source, options, whitelist)

    MediaEmbed::IframeBuilder.expects(:new).with(source, options, whitelist).returns(builder)

    MediaEmbed::Video.youtube_template('1234')
  end

  test 'it should call the IframeBuilder with vimeo source and vimeo src whitelist' do
    source = '//player.vimeo.com/video/1234'
    options = {}
    whitelist = MediaEmbed::VIMEO_SRC_WHITELIST

    builder = MediaEmbed::IframeBuilder.new(source, options, whitelist)

    MediaEmbed::IframeBuilder.expects(:new).with(source, options, whitelist).returns(builder)

    MediaEmbed::Video.vimeo_template('1234')
  end

end
