require 'minitest/autorun'
require 'minitest/pride'
require './lib/time'

class TimeTest < Minitest::Test

  def test_it_formats_date_DDMMYY
    time = Time.new
    assert_equal 260715, time.formatted_time
  end

end
