require 'test_helper'
require 'media_embed/podcast'

class PodcastTest < Minitest::Test

  test 'should wrap a given code in the soundcloud embed iframe' do
    code = '1234'

    iframe = %Q(<iframe width="100%" height="450" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//soundcloud.com/#{code}&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"></iframe>)

    assert_equal iframe, MediaEmbed::Podcast.soundcloud_template(code)
  end

end
