# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'picguard/version'

Gem::Specification.new do |spec|
  spec.name          = "picguard"
  spec.version       = Picguard::VERSION
  spec.authors       = ["Szymon Baranowski", "Tomasz Jaśkiewicz"]
  spec.email         = ["szymon.baranowski@netguru.pl", "tomasz.jaskiewicz@netguru.pl"]

  spec.summary       = %q{A gem for filtering a pictures that are being uploaded to your server.}
  spec.description   = %q{Picguard guards your application by filtering out the pictures containing inappropriate content.}
  spec.homepage      = "https://github.com/netguru/picguard"
  spec.license       = "MIT"

  spec.add_dependency "google-api-client"
  spec.add_dependency "mini_magick"
  spec.add_dependency "activemodel"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
