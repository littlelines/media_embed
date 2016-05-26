require "test_helper"

class HandlerTest < ActiveSupport::TestCase
  include MediaEmbed::Handler

  CODE = MediaEmbed::Handler::CODE

  YOUTUBE_URLS =  %w( youtube.com/watch?v=CODE
                      youtu.be/CODE
                      youtu.be/CODE?some=param
                      youtube.com/embed/CODE
                    )

  VIMEO_URLS = %w( vimeo.com/8888
                   vimeo.com/8888?some=param
                   player.vimeo.com/video/8888
                   vimeo.com/channels/channel-name/8888
                   vimeo.com/groups/groups-name/8888
                   vimeo.com/album/2222/video/8888
                 )

  SOUNDCLOUD_URL = %w( soundcloud.com/username/code-for-podcast )

  test "it extracts codes from all youtube structures" do
    YOUTUBE_URLS.map { |url| "irrelevantinfo#{url}" }.each do |url|
      match = youtube?(url)[CODE]
      assert match == 'CODE', "#{url} does not return CODE, it reutrns #{match}"
    end
  end

  test "it extracts code from all vimeo structures" do
    VIMEO_URLS.map { |url| "irrelevantinfo#{url}" }.each do |url|
      match = vimeo?(url)[CODE]
      assert match == '8888', "#{url} does not return CODE, it returns #{match}"
    end
  end

  test "it extracts code for soundcloud structure" do
    match = soundcloud?("irrelevantinfo#{SOUNDCLOUD_URL}")[CODE]
    assert match == 'username/code-for-podcast', "#{SOUNDCLOUD_URL} does not return 'username/code-for-podcast', it returns #{match}"
  end
end

