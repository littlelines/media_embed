require 'test_helper'
require 'media_embed/video'

class VideoTest < Minitest::Test

  test 'it should wrap a youtube code without options in an iframe tag' do
    source = '//www.youtube.com/embed/1234/enablejsapi=1'

    assert_equal %(<iframe src='#{source}' ></iframe>), MediaEmbed::Video.youtube_template('1234')
  end

  test 'it should wrap a vimeo code without options in an iframe tag' do
    source = '//player.vimeo.com/video/1234'

    assert_equal %(<iframe src='#{source}' ></iframe>), MediaEmbed::Video.vimeo_template('1234')
  end

  test 'it should wrap a source with options' do
    source = '//www.youtube.com/embed/1234/enablejsapi=1'
    iframe_with_options = %(<iframe src='#{source}' width='50px' height='50px'></iframe>)

    assert_equal iframe_with_options, MediaEmbed::Video.youtube_template('1234', width: '50px', height: '50px')
  end

end
