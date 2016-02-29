require "picguard"

class GuardValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    image_path = fetch_image_path(record, attribute)
    unless valid?(image_path)
      record.errors.add(attribute, @message, options.merge(value: value))
    end
  end

  private

  def fetch_image_path(record, attribute)
    arr = [attribute].push(*Array(options[:method_name]))
    arr.inject(record, :public_send)
  end

  def valid?(image_path)
    return false unless path_exists?(image_path)
    result = Picguard.analyze(
      image_path:
        image_path,
      safe_search:
        options[:safe_search] || false,
      face_detection:
        options[:face_detection] || false,
      threshold_adult:
        options[:threshold_adult] || Picguard.configuration.threshold_adult,
      threshold_violence:
        options[:threshold_violence] || Picguard.configuration.threshold_violence,
      threshold_face:
        options[:threshold_face] || Picguard.configuration.threshold_face,
    )

    return false if options[:safe_search] && safe_violation?(result)
    return false if options[:face_detection] && !face_recognised?(result)
    true
  end

  def safe_violation?(result)
    return false if (!result[:safe_search][:adult] && !result[:safe_search][:violence])
    @message = "Picture shows inappropriate content."
    true
  end

  def path_exists?(image_path)
    return true if image_path && File.exist?(image_path)
    @message = "Picture doesn't exist."
    false
  end

  def face_recognised?(result)
    return true if options[:face_detection] && result[:face_recognised]
    @message = "Face could not be recognised on given picture."
    false
  end
end
