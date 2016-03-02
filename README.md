[![Code Climate](https://codeclimate.com/repos/56cdc29e7220a54948003189/badges/6455466a41f102f5f517/gpa.svg)](https://codeclimate.com/repos/56cdc29e7220a54948003189/feed) [![Test Coverage](https://codeclimate.com/repos/56cdc29e7220a54948003189/badges/6455466a41f102f5f517/coverage.svg)](https://codeclimate.com/repos/56cdc29e7220a54948003189/coverage)
[![Circle CI](https://circleci.com/gh/netguru/picguard.svg?style=svg)](https://circleci.com/gh/netguru/picguard)

# Picguard
Picguard guards your application by filtering out the pictures showing inappropriate content.
It uses Google Vision API to process the pictures that are being uploaded via your application.

# Why use Picguard?
Imagine a business application that allows user to upload a photo when creating his profile. The user is free to upload any kind of picture (including pictures showing violent scenes or adult content). The most popular solution for that is implementing a feature that allows other users to report the inappropriate content - which means you rely on your users when it comes to the safety of your application - not so great. Another scenario would be: what if for a profile picture an application should only allow the picture showing a human face? The soultion would be often the same as in the first example.
Picguard lets you configure your preferences (globally or separately for each model) for image filtering and gives you a clean solution to validate the picture before it's saved.

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
`threshold_face` is the threshold for face recognition. Google responds with a float value from 0 to 1 that reflects how sure the Google API is when it comes to face recognition. Only the picture with values above your threshold will be categorised as the ones containing human face.

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
`method_name` is the name of the `image`'s attribute method that returns image file path

## Sample validations for popular file-uploading gems

### CarrierWave

```ruby
class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :avatar, guard: {
    safe_search: true,
    face_detection: true,
    method_name: :path
  }
end
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

### Core Team

* Szymon Baranowski (szymon.baranowski@netguru.co)
* Tomasz Jaśkiewicz (tomasz.jaskiewicz@netguru.co)
