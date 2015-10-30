require_relative "./time"
require_relative "./key_generator"

class Offset

  attr_accessor :key, :time

  def initialize
    @time = retrieve_time
    @key = KeyGenerator.new
  end

  def retrieve_time
    time_actual = Time.new
    time_actual.formatted_time
  end

  def format_time_offsets
    time = retrieve_time
    time *= time
    time_digits = time.to_s[-4, 4].chars
  end

  def get_key
    key.rotation_collector
  end

  def offset_calculator
    pre_key = get_key.zip(format_time_offsets)
    pre_key.map do |pair|
      pair.map(&:to_i).reduce(:+)
    end
  end

  def external_offset_calc(ext_key, ext_date)
    pre_key = ext_key.zip(ext_date)
      pre_key.map do |pair|
        pair.map(&:to_i).reduce(:+) * -1
    end
  end

end

test_runner = Offset.new
test_runner.external_offset_calc([12345],[280715] )
