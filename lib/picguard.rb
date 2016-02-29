require "picguard/version"
require "json"
# require "picguard_init"
require "guard_validator"
require "configuration"
require "services/builders/request"
require "services/analyzer"
require "services/image_preparator"


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

    prepared_image_path = Services::ImagePreparator.new(image_path, face_detection, safe_search).call

    Services::Analyzer.new(
      Services::Builders::Request.new(
        prepared_image_path, safe_search, face_detection
      ).call,
      threshold_adult,
      threshold_violence,
      threshold_face
    ).call
  end
end
