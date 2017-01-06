# MediaEmbed

Easily embed media into haml/erb templates. It comes bundled with a railtie to
easily integrate into Rails.

Currently supports:

### Videos

+ Youtube
+ Vimeo

### Podcasts

+ Soundcloud

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'media_embed'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install media_embed

## Usage

Include `MediaEmbed::Handler` into your class and use the `embed` method.

```ruby
class Post
  include MediaEmbed::Handler

  def media
    embed(@url)
  end
end
```

If you're using Rails, you can directly embed your URLs into your template:

```erb
<div id='my-fancy-media'>
  <%= embed(url).html_safe %>
</div>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push git
commits and tags, and push the `.gem` file
to [rubygems.org](https://rubygems.org).

## TODO

+ Continue to build regex/template matchers for any other embeddable media.
+ Allow embed options.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/littlelines/embed_media.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
