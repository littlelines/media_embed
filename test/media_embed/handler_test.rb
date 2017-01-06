require 'test_helper'
require 'media_embed/handler'

class HandlerTest < Minitest::Test
  CODE = MediaEmbed::Handler::CODE

  YOUTUBE_URLS = %w(youtube.com/watch?v=CODE
                    youtu.be/CODE
                    youtu.be/CODE?some=param
                    youtube.com/embed/CODE).freeze

  VIMEO_URLS = %w(vimeo.com/8888
                  vimeo.com/8888?some=param
                  player.vimeo.com/video/8888
                  vimeo.com/channels/channel-name/8888
                  vimeo.com/groups/groups-name/8888
                  vimeo.com/album/2222/video/8888).freeze

  SOUNDCLOUD_URL = %w(soundcloud.com/username/code-for-podcast).freeze

  def setup
    @klass = Class.new { include MediaEmbed::Handler }.new
  end

  test 'extracts codes from all youtube structures' do
    YOUTUBE_URLS.map { |url| "irrelevantinfo#{url}" }.each do |url|
      match = @klass.youtube?(url)[CODE]
      assert_equal match, 'CODE'
    end
  end

  test 'extracts code from all vimeo structures' do
    VIMEO_URLS.map { |url| "irrelevantinfo#{url}" }.each do |url|
      match = @klass.vimeo?(url)[CODE]
      assert_equal match, '8888'
    end
  end

  test 'extracts code for soundcloud structure' do
    match = @klass.soundcloud?("irrelevantinfo#{SOUNDCLOUD_URL}")[CODE]
    assert_equal match, 'username/code-for-podcast'
  end
end
