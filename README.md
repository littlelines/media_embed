# MediaEmbed

Easily embed media into haml/erb templates, bypassing the need to use JavaScript
APIs if desired.

It comes bundled with a railtie for automatic Rails integration.

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

### Options

The `embed` method takes an optional options hash.

`embed(url, { width: '500px', height: '500px', autoplay: true })`

### More options details

Any of the following whitelisted options can be specified:

#### IFrame Attributes

+ align                   - align iframe compared to surrounding elements
+ frameborder             - display border
+ height                  - height in pixels
+ marginheight            - top/bottom margin in pixels
+ marginwidth             - left/right margin in pixels
+ name                    - name of iframe element
+ width                   - width in pixels
+ allowfullscreen         - true by default, set 'false' to remove
+ webkitallowfullscreen   - true by default, set 'false' to remove
+ mozallowfullscreen      - true by default, set 'false' to remove

See [w3schools.com IFrame tag page](http://www.w3schools.com/tags/tag_iframe.asp)
for more information about the accepted attributes.

#### Youtube Parameters

+ autoplay       - start playing video when iframe loads
+ cc_load_policy  - closed captions
+ color           - red or white, white disables modestbranding
+ controls        - display controls
+ disablekb       - disable keyboard controls
+ enablejsapi     - set origin to domain if using
+ end             - stop video at (n) seconds from start
+ fs              - show fullscreen button in player
+ h1              - set the player's interface language
+ iv_load_policy  - show video annotations
+ list            - used with listType
+ listType        - used with list (search, playlist, or user_uploads)
+ loop            - loop video or playlist
+ modestbranding  - do not display YouTube logo in control bar
+ origin          - extra security measure with IFrame API
+ playlist        - comma separated list of video IDs to play
+ playsinline     - play inline in HTML5 player on iOS
+ rel             - show related videos at end
+ showinfo        - show video metadata
+ start           - start video in seconds from start

See the [IFrame Player API reference](https://developers.google.com/youtube/player_parameters)
for more information about the accepted parameters.

#### Vimeo Parameters

+ autopause - pause when another video starts playing
+ autoplay  - play when iframe loads
+ badge     - enable/disable badge
+ byline    - show user's byline on video
+ color     - color of video controls in hexa
+ loop      - loop video when it reaches the end
+ player_id - unique id to pass back with app JS API responses
+ portrait  - show user's portrait on video
+ title     - show title on video

See the [player embedding reference](https://developer.vimeo.com/player/embedding)
for more information about the accepted parameters.

#### Soundcloud Parameters

+ auto\_play          - true/false (will also respond to 'autoplay')
+ buying              - true/false (show/hide buy buttons)
+ color               - hex code (color play button and other controls)
+ default_height      - a number that overrides the player's autoscale
+ default_width       - a number that overrides the player's autoscale
+ download            - true/false (show/hide download buttons)
+ enable_api          - true/false (enable the Javascript API callbacks)
+ font                - overrides the default font
+ sharing             - true/false (show/hide share buttons)
+ show_artwork        - true/false
+ show_bpm            - true/false
+ show_comments       - true/false
+ show_playcount      - true/false
+ show_user           - true/false
+ single_active       - true/false (toggle on/off other players on page on play)
+ start_track         - number, indicating which track in the playlist to start on
+ text_buy_set        - a string to point to the buy link
+ text_buy_track      - a string to point to the buy link
+ text_download_track - a string to point to the download link
+ theme_color         - hex code (player background color)

See the [Soundcloud Widget API docs](https://developers.soundcloud.com/docs/api/html5-widget#params)
or [the Widget docs](https://developers.soundcloud.com/docs/widget#parameters)
for more information about the accepted parameters.

#### General Options Notes

A single-level hash assumes that you want all iframes to behave the same way.
Including a parameter that is only whitelisted for one service will not effect
any of the others.

`{ show_user: 0, width: '500px' }` will set all iframes to 500px wide, but only
the Soundcloud iframes will append '&show_user=0' to its source.

If you want iframes to behave differently, or just want to clarify which options
belong to which services, you can break the hash down with keywords for each
service (`soundcloud`, `youtube`, and `vimeo`):

```ruby
{
  soundcloud: {
    width: '200px'
  },
  youtube: {
    autoplay: 1,
    color: 'white'
  },
  loop: 0,
  autoplay: 0,
  width: '500px',
  show_artwork: 0
}
```

The aforementioned hash:

+ will render Soundcloud iframes at 200px wide, and all others at 500px wide
+ YouTube iframes will autoplay, all other iframes will not
+ YouTube iframes will be white, all others will have their default color
+ no iframes will loop
+ Soundcloud will not show artwork, and no other iframe will be rendered with
    the show_artwork parameter

In short, top-level parameters will be used in all iframes where the given
parameter is whitelisted. Parameters under a service key will override all
top-level parameters for that service.

If you would rather use a provided JS API to control your videos, simply supply
the necessary parameters (`{ enablejsapi: 1, origin: "#{yourdomainhere}"}` for
YouTube, for example) and go about your normal day with the JavaScript.

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/littlelines/embed_media.

If submitting a PR, please include tests and relevant information to the README.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
