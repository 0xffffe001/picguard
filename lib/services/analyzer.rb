require 'services/validators/likelihood'

module Services
  class Analyzer
    def initialize(result, threshold_adult, threshold_violence, threshold_face)
      @result = result
      @threshold_adult = threshold_adult
      @threshold_violence = threshold_violence
      @threshold_face = threshold_face
    end

    def call
      result_hash = {}
      unless @result[:safe_search_annotation].nil?
        result_hash[:safe_search] = analyze_safe_search_annotation(@result[:safe_search_annotation])
      end

      unless @result[:face_annotations].nil?
        detection_confidence = @result[:face_annotations].first[:detection_confidence]
      end
      detection_confidence ||= 0

      result_hash[:face_recognised] = analyze_face_annotation(detection_confidence)
      result_hash
    end

    private

    def analyze_safe_search_annotation(hash_result)
      {
        violence: Validators::Likelihood.new(hash_result[:violence], @threshold_violence).call,
        adult: Validators::Likelihood.new(hash_result[:adult], @threshold_adult).call,
      }
    end

    def analyze_face_annotation(float_result)
      float_result > @threshold_face
    end
  end
end
