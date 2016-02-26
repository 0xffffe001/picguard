require "picguard/version"
require "json"
# require "picguard_init"
require "configuration"
require "services/builders/request"
require "services/analyzer"


module Picguard
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.analyze(image_path:,
                   safe_search: true,
                   face_detection: true,
                   threshold_adult: Picguard.configuration.threshold_adult,
                   threshold_violence: Picguard.configuration.threshold_violence,
                   threshold_face: Picguard.configuration.threshold_face
                   )

    Services::Analyzer.new(
      Services::Builders::Request.new(
        image_path, safe_search, face_detection
      ).call,
      threshold_adult,
      threshold_violence,
      threshold_face
    ).call
  end
end
