[![Code Climate](https://codeclimate.com/repos/56cdc29e7220a54948003189/badges/6455466a41f102f5f517/gpa.svg)](https://codeclimate.com/repos/56cdc29e7220a54948003189/feed) [![Test Coverage](https://codeclimate.com/repos/56cdc29e7220a54948003189/badges/6455466a41f102f5f517/coverage.svg)](https://codeclimate.com/repos/56cdc29e7220a54948003189/coverage)
[![Circle CI](https://circleci.com/gh/netguru/picguard.svg?style=svg)](https://circleci.com/gh/netguru/picguard)
![](https://raw.githubusercontent.com/netguru/picguard/master/picguard_logo.png)

Picguard guards your application by filtering out the pictures showing inappropriate content.
It uses Google Vision API to process the pictures that are being uploaded via your application.

# Why use Picguard?
Imagine a business application that allows user to upload a photo when creating his profile. The user is free to upload any kind of picture (including pictures showing violent scenes or adult content). The most popular solution for that is implementing a feature that allows other users to report the inappropriate content - which means you rely on your users when it comes to the safety of your application - not so great. Another scenario would be: what if for a profile picture an application should only allow the picture showing a human face? The soultion would be often the same as in the first example.
Picguard lets you configure your preferences (globally or separately for each model) for image filtering and gives you a clean solution to validate the picture before it's saved.

## Requirements

[ImageMagick](http://www.imagemagick.org) must be installed and Picguard must have access to it.

If you're on Mac OS X, you'll want to run the following with Homebrew:

```bash
brew install imagemagick
```

If you're on Ubuntu (or any Debian base Linux distribution), you'll want to run the following with apt-get:

```bash
sudo apt-get install imagemagick
```

After the installation you should be able to run `which convert` in your terminal and you should see for example `/usr/local/bin/convert` as a response.

## Installation

Add Picguard to your Gemfile:

```ruby
gem 'picguard'
```

And run `bundle install` within your app's directory.

## Configuration
In your Rails app create a file such as `config/initializers/picguard.rb` and fill it up with your default configuration.
Example:

```ruby
Picguard.configure do |config|
  config.google_api_key = #{YOUR_GOOGLE_API_KEY}
  config.threshold_adult = "POSSIBLE"
  config.threshold_violence = "LIKELY"
  config.threshold_face = 0.8
end
```

##### Let's go through all of the attributes you need to set up in the config:

`google_api_key` is the secret key that you use to authenticate to the Google Vision API, you can generate one that is connected to your Google Project. More about generating the key can be found [here](https://cloud.google.com/vision/docs/getting-started#setting_up_an_api_key). If you are completely new to the Google Cloud Platform you should probably start [here](https://cloud.google.com/vision/docs/getting-started).   
`threshold_adult` and `threshold_violence` are the thresholds for the adult and violent content. This is the highest value that you consider acceptable, everything above this level will be categorised as unsafe. For all of the likelihood levels please check [this piece of documentation](https://cloud.google.com/vision/reference/rest/v1/images/annotate#Likelihood).   
`threshold_face` is the threshold for face recognition. Google responds with a float value from 0 to 1 that reflects how sure the Google API is when it comes to face recognition. Only the pictures with values above your threshold will be categorised as the ones showing human face.   

## Validations
To validate the content of the picture simply add the following validation to your model:

```ruby
  validates :image, guard: {
    safe_search: true,
    face_detection: true,
    method_name: :img_path
  }
```
###### where

`image` is the name of the model's attribute that should be validated   
`guard` is the name of the picguard validator  
`safe_search` and `face_detection` are the flags reflecting what should be validated for given model   
`method_name` value is the name of the `image`'s attribute method that returns image file path     

*NOTE: Sometimes to return file path it's necessary to chain methods such as `avatar.tempfile.path`. In such case you need to pass an array of symbols to the `method_name` attribute (e.g. `[:tempfile, :path])`. For popular file-uploading gems, Picguard gives you a `tool` attribute that is used interchangeably with the `method_name`. More examples below.*   

## Sample validations for popular file-uploading gems

### [CarrierWave](https://github.com/carrierwaveuploader/carrierwave)

```ruby
class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :avatar, guard: {
    safe_search: true,
    face_detection: true,
    tool: :carrierwave
  }
end
```

### [Paperclip](https://github.com/thoughtbot/paperclip)

```ruby
class User < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: '300x300>', thumb: '100x100>' },
    default_url: "/images/:style/missing.jpg"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :avatar, guard: {
    safe_search: false,
    face_detection: true,
    threshold_face: 0.5,
    tool: :paperclip
  }
end
```

### [Dragonfly](https://github.com/markevans/dragonfly)

```ruby
class User < ActiveRecord::Base
  dragonfly_accessor :avatar

  validates :avatar, presence: true, guard: {
    safe_search: true,
    threshold_adult: 'VERY_LIKELY',
    tool: :dragonfly
  }
end
```

## Custom usage

We also provide `analyze` method to analyze images wherever you want:

```ruby
Picguard.analyze(
  image_path: 'path/to/image',
  safe_search: true,
  face_detection: true,
  threshold_adult: 'POSSIBLE',
  threshold_violence: 'UNLIKELY',
  threshold_face: 0.7
)
```

* `image_path` - provide path to image
* `safe_search` - determine whether image should be safe due to adult and violence content [`true`/`false`]
* `face_detection` - determine whether image should contain human face [`true`/`false`]
* `threshold_adult` - [*optional*] provide threshold for adult content different than defined in initializer
* `threshold_violence` - [*optional*] provide threshold for violence content different than defined in initializer
* `threshold_face` - [*optional*] provide threshold for face detection different than defined in initializer

*NOTE: the bigger the image, the longer it takes to analyze it. For images bigger than `2000px x 2000px` consider using progress bars or background processing solutions like [Sidekiq](https://github.com/mperham/sidekiq), [Resque](https://github.com/resque/resque), [DelayedJob](https://github.com/collectiveidea/delayed_job), etc.*

## Dependencies

We use two main dependencies - **[Google API Client gem](https://github.com/google/google-api-ruby-client)** to connect with the Goole Cloud Vision API, and the **[MiniMagick gem](https://github.com/minimagick/minimagick)** to resize bigger pictures before proccessing them via Google Cloud.   

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

### Core Team

* Szymon Baranowski (szymon.baranowski@netguru.co)
* Tomasz Jaśkiewicz (tomasz.jaskiewicz@netguru.co)
