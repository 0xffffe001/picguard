require 'picguard'

module Services
  module Validators
    class Likelihood
      RESPONSES = {
        unknown:        0,
        very_unlikely:  1,
        unlikely:       2,
        possible:       3,
        likely:         4,
        very_likely:    5,
      }.freeze
      private_constant :RESPONSES

      def initialize(response, threshold)
        @response, @threshold = response, threshold
      end

      def call
        value_for(@response) > value_for(@threshold)
      end

      private

      def value_for(response)
        RESPONSES.fetch(response.downcase.to_sym)
      end
    end
  end
end
