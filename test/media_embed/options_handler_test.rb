require 'test_helper'
require 'media_embed/options_handler'

class OptionsHandlerTest < Minitest::Test

  test 'it should set the prioritized options' do
    options = { youtube: { key: "value" }, not_youtube: "not youtube" }

    handler = MediaEmbed::OptionsHandler.new(:youtube, options)

    expected_options = { key: "value" }

    assert_equal expected_options, handler.prioritized_options
  end

  test 'it should return remaining options that do not override prioritized options' do
    options = { youtube: { autoplay: true }, autoplay: false, width: '500px' }

    handler = MediaEmbed::OptionsHandler.new(:youtube, options)

    expected_options = { width: '500px' }

    assert_equal expected_options, handler.remaining_options
  end

  test 'it should return prioritized and remaining options, merged' do
    options = { youtube: { autoplay: true }, autoplay: false, width: '500px' }

    handler = MediaEmbed::OptionsHandler.new(:youtube, options)

    expected_options = { autoplay: true, width: '500px' }

    assert_equal expected_options, handler.consolidate_options
  end

  test 'it should return an empty hash for an empty hash' do
    options = {}

    handler = MediaEmbed::OptionsHandler.new(:youtube, options)

    assert_equal options, handler.consolidate_options
  end

end
