require 'test_helper'
require 'media_embed/iframe_builder'

class IframeBuilderTest < Minitest::Test

  def setup
    @source = '//youtube.com/embed/1234'
  end

  test 'it should return an iframe with the appropriate source, given no options' do
    builder = MediaEmbed::IframeBuilder.new(@source)

    iframe = %(<iframe src="#{@source}"></iframe>)

    assert_equal iframe, builder.build
  end

  test 'it should return an iframe with attributes, given valid iframe attributes' do
    options = { :width => '500px' }

    builder = MediaEmbed::IframeBuilder.new(@source, options)

    iframe = %(<iframe src="#{@source}" width="500px"></iframe>)

    assert_equal iframe, builder.build
  end

  test 'it should return an iframe with no attributes, given invalid iframe attributes' do
    options = { :notanattr => 'fake' }

    builder = MediaEmbed::IframeBuilder.new(@source, options)

    iframe = %(<iframe src="#{@source}"></iframe>)

    assert_equal iframe, builder.build
  end

  test 'it should return an iframe with a src that has parameters, given a parameters src_whitelist' do
    options = { :autoplay => '0', :loop => 1 }
    src_whitelist = [:autoplay, :loop]

    builder = MediaEmbed::IframeBuilder.new(@source, options, src_whitelist)

    iframe = %(<iframe src="#{@source}?autoplay=0&loop=1"></iframe>)

    assert_equal iframe, builder.build
  end

  test 'it should return an iframe with a src with *only* src_whitelisted parameters' do
    options = { :autoplay => '0', :loop => 1, :notanattr => 'fake' }
    src_whitelist = [:autoplay, :loop]

    builder = MediaEmbed::IframeBuilder.new(@source, options, src_whitelist)

    refute builder.build.match('notanattr=fake')
  end

  test 'it should combine iframe attrs and src parameters' do
    options = { :autoplay => '0', :loop => 1, :notanattr => 'fake', :width => '500px' }
    src_whitelist = [:autoplay, :loop]

    builder = MediaEmbed::IframeBuilder.new(@source, options, src_whitelist)

    iframe = %(<iframe src="#{@source}?autoplay=0&loop=1" width="500px"></iframe>)

    assert_equal iframe, builder.build
  end
end
