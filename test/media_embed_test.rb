require 'test_helper'

class MediaEmbedTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, MediaEmbed
  end

  test "it has a version number" do
    refute_nil ::MediaEmbed::VERSION
  end
end
