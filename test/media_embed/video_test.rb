require 'test_helper'
require 'media_embed/video'

class VideoTest < Minitest::Test

  # YOUTUBE

  test 'it should call to the IframeBuilder with youtube source and youtube src whitelist' do
    source = '//www.youtube.com/embed/1234'
    options = {}
    consolidated_options = { consolidated: 'options' }
    whitelist = MediaEmbed::Video::YOUTUBE_SRC_WHITELIST

    builder = MediaEmbed::IframeBuilder.new(source, options, whitelist)

    MediaEmbed::Video.expects(:consolidated_options).with(:youtube, {}).returns(consolidated_options)
    MediaEmbed::IframeBuilder.expects(:new).with(source, consolidated_options, whitelist).returns(builder)

    MediaEmbed::Video.youtube_template('1234')
  end

  test 'it should call to OptionsHandler with Youtube Options' do
    handler = MediaEmbed::OptionsHandler.new(:youtube, {})

    MediaEmbed::OptionsHandler.expects(:new).with(:youtube, {}).returns(handler)
    MediaEmbed::OptionsHandler.any_instance.expects(:consolidate_options).returns({})

    MediaEmbed::Video.consolidated_options(:youtube, {})
  end

  # VIMEO

  test 'it should call the IframeBuilder with vimeo source and vimeo src whitelist' do
    source = '//player.vimeo.com/video/1234'
    options = {}
    consolidated_options = { consolidated: 'options' }
    whitelist = MediaEmbed::Video::VIMEO_SRC_WHITELIST

    builder = MediaEmbed::IframeBuilder.new(source, options, whitelist)

    MediaEmbed::Video.expects(:consolidated_options).with(:vimeo, {}).returns(consolidated_options)
    MediaEmbed::IframeBuilder.expects(:new).with(source, consolidated_options, whitelist).returns(builder)

    MediaEmbed::Video.vimeo_template('1234')
  end

  test 'it should call to OptionsHandler with Vimeo Options' do
    handler = MediaEmbed::OptionsHandler.new(:vimeo, {})

    MediaEmbed::OptionsHandler.expects(:new).with(:vimeo, {}).returns(handler)
    MediaEmbed::OptionsHandler.any_instance.expects(:consolidate_options).returns({})

    MediaEmbed::Video.consolidated_options(:vimeo, {})
  end

end
