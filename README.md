# MediaEmbed

Easily embed media (with options) into haml/erb templates, bypassing the need to use JavaScript
APIs if desired.

This gem comes bundled with a railtie for automatic Rails integration.

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

Include `MediaEmbed::Handler` into your class and use the `embed` method with an
optional options hash.

```ruby
class Post
  include MediaEmbed::Handler

  def media(options = {})
    embed(@url, options)
  end
end
```

If you're using Rails, you can directly embed your URLs into your template:

```erb
<div id='my-fancy-media'>
  <%= embed(url, @options).html_safe %>
</div>
```

### Options

The `embed` method takes an optional options hash.

`embed(url, { width: '500px', height: '500px', autoplay: true })`

### More options details

Any of the following whitelisted options can be specified:

#### IFrame Attributes

| Attribute Name        | Accepted Values                   | Description                                   |
| --------------------- | --------------------------------- | --------------------------------------------- |
| align                 | left/right/top/middle/bottom      | align iframe compared to surrounding elements |
| frameborder           | 0/1                               | display border                                |
| height                | "#{n}px"                          | height in pixels                              |
| marginheight          | "#{n}px"                          | top/bottom margin in pixels                   |
| marginwidth           | "#{n}px"                          | left/right margin in pixels                   |
| name                  | a string                          | name of iframe element                        |
| width                 | "#{n}px"                          | width in pixels                               |
| allowfullscreen       | true/false                        | allow full screen                             |
| webkitallowfullscreen | true/false                        | allow fullscreen for webkit                   |
| mozallowfullscreen    | true/false                        | allow fullscreen for mozilla                  |

See [w3schools.com IFrame tag page](http://www.w3schools.com/tags/tag_iframe.asp)
for more information about the accepted attributes.

#### Youtube Parameters

| Attribute Name | Accepted Values | Description |
| --- | --- | --- |
| autoplay | true/false | start playing the video when iframe loads |
| cc\_load\_policy | true/false | always show closed captions, no matter the user's settings |
| color | red/white | color of progress bar (white disables modestbranding) |
| controls | true/false | display controls |
| disablekb | true/false | disable keyboard controls |
| enablejsapi | true/false | enables JS API (set origin to domain if using) |
| end | "#{n}" | stop video at #{n} seconds from start |
| fs | true/false | show fullscreen button in player |
| h1 | language code | set the player's interface language |
| iv\_load\_policy | true/false | show video annotations |
| list | depends on listType | see Iframe API reference (linked below table) |
| listType | search, playlist, or user\_uploads | see Iframe API reference (linked below table) |
| loop | true/false | loop video or playlist |
| modestbranding | true/false | do not display YouTube logo in control bar |
| origin | domain name | extra security measure with IFrame API |
| playlist | comma separated list of video IDs | video IDs for videos to play in IFrame as a playlist |
| playsinline | true/false | play inline with HTML5 player on iOS |
| rel | true/false | show related videos at the end of the video |
| showinfo | true/false | show video metadata |
| start | "#{n}" | start video #{n} seconds from start |

See the [IFrame Player API reference](https://developers.google.com/youtube/player_parameters)
for more information about the accepted parameters.

#### Vimeo Parameters

| Attribute Name | Accepted Values | Description |
| --- | --- | --- |
| autopause | true/false | pause when another video starts playing |
| autoplay | true/false | play when iframe loads |
| badge | true/false | enable/disable badge |
| byline | true/false | show user's byline on the video |
| color | hex code | color of video controls |
| loop | true/false | loop video when it reaches the end |
| player\_id | unique ID | ID t pass back with app JS API responses |
| portrait | true/false | show user's portrait on video |
| title | true/false | show title on video |

See the [player embedding reference](https://developer.vimeo.com/player/embedding)
for more information about the accepted parameters.

#### Soundcloud Parameters

| Attribute Name | Accepted Values | Description |
| --- | --- | --- |
| auto\_play | true/false | play video when iframe loads (can also use 'autoplay' in embed method options hash) |
| buying | true/false | show/hide buy buttons |
| color | hex code | color for controls |
| default\_height | number | overrides the player's autoscale |
| default\_width | number | overrides the player's autoscale |
| download | true/false | show/hide download buttons |
| enable\_api | true/false | enable JavaScript API callbacks |
| font | font name | overrides the default font |
| sharing | true/false | show/hide share buttons |
| show\_artwork | true/false | show/hide artwork |
| show\_bpm | true/false | show/hide beats/minute |
| show\_comments | true/false | show/hide comments |
| show\_playcount | true/false | show number of plays |
| show\_user | true/false | show user info |
| single\_active | true/false | toggle off other plays on page when pressing play |
| start\_track | number | which track in the playlist to start on |
| text\_buy\_set | string | link text to buy link |
| text\_buy\_track | string | link text to buy link |
| text\_download\_track | string | link text to download link |
| theme\_color | hex code | player background color |

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
