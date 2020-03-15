# frozen_string_literal: true

module MeasurementConversionService
  def self.convert(measurement)
    return if measurement.nil?

    parsed_measurement = Measurement.parse(measurement)
    if parsed_measurement.unit.name == 'oz'
      converted_measurement = Unitwise(parsed_measurement.quantity, 'oz fl').to_centiliter.round(0)
    else
      converted_measurement = measurement
    end
    converted_measurement.to_s
  end
end
