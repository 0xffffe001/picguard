require "picguard"

module Picguard
  class Likelihood
    RESPONSE_CLASSES = {
      unknown: 0,
      very_unlikely: 1,
      unlikely: 2,
      possible: 3,
      likely: 4,
      very_likely: 5
    }.freeze

    private_constant :RESPONSE_CLASSES

    def self.appropriate?(response, threshold)
      value_of(response) <= value_of(threshold)
    end

    private

    def value_of(response)
      RESPONSE_CLASSES.fetch(response.downcase.to_sym)
    end
  end
end
