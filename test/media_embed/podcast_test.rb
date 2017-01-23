require 'test_helper'
require 'media_embed/podcast'

class PodcastTest < Minitest::Test

  # SOUNDCLOUD

  test 'it should call to the IframeBuilder with soundcloud source, consolidated options, and soundcloud src whitelist' do
    source = 'https://w.soundcloud.com/player?url=https%3A//soundcloud.com/1234'
    options = {}
    consolidated_options = { consolidated: 'options' }
    whitelist = MediaEmbed::Podcast::SOUNDCLOUD_SRC_WHITELIST

    builder = MediaEmbed::IframeBuilder.new(source, options, whitelist)

    MediaEmbed::Podcast.expects(:consolidated_options).with(:soundcloud, {}).returns(consolidated_options)
    MediaEmbed::IframeBuilder.expects(:new).with(source, consolidated_options, whitelist).returns(builder)

    MediaEmbed::Podcast.soundcloud_template('1234')
  end

  test 'it should call to OptionsHandler with options' do
    handler = MediaEmbed::OptionsHandler.new(:soundcloud, {})

    MediaEmbed::OptionsHandler.expects(:new).with(:soundcloud, {}).returns(handler)
    MediaEmbed::OptionsHandler.any_instance.expects(:consolidate_options).returns({})

    MediaEmbed::Podcast.consolidated_options(:soundcloud, {})
  end

  test 'it should interpret :autoplay as :auto_play' do
    handler = MediaEmbed::OptionsHandler.new(:soundcloud, {})
    options = { autoplay: true }

    MediaEmbed::OptionsHandler.expects(:new).with(:soundcloud, {}).returns(handler)
    MediaEmbed::OptionsHandler.any_instance.expects(:consolidate_options).returns(options)

    expected_options = { auto_play: true }

    assert_equal expected_options, MediaEmbed::Podcast.consolidated_options(:soundcloud, {})
  end

end
