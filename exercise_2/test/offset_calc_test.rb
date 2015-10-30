require 'minitest/autorun'
require 'minitest/pride'
require "../lib/time"
require "../lib/key_generator"
require '../lib/offset_calc'

class Offset_calcTest < Minitest::Test

  def test_offset_calc_has_access_to_key_generator
    key_tester = KeyGenerator.new
    assert key_tester.rotation_collector
  end

  def test_rotation_collection_has_4_values
    key_tester = KeyGenerator.new
    result = key_tester.rotation_collector
    assert_equal 4, result.length
  end

  def test_offset_calc_has_access_to_formatted_time_from_Time_class
    #test is skewed and changes ever day
    offset_tester = Offset.new
    assert_equal 290715, offset_tester.retrieve_time
  end

  def test_offset_calc_can_square_retrieved_time
    offset_tester = Offset.new
    assert offset_tester.format_time_offsets
  end

  def test_it_grabs_last_four_digits_of_time
    offset_tester = Offset.new
    assert_equal 4 , offset_tester.format_time_offsets.length
  end

  def test_it_calculates_random_key_as_expected
    offset_tester = Offset.new
    assert offset_tester.offset_calculator
  end

  def test_it_calculates_negative_key_when_fixed_nums_are_given
    offset_tester = Offset.new
    expected = [-25, -46, -46, -49]
    assert_equal expected, offset_tester.external_offset_calc([24,44,44,44], [1,2,2,5])
  end

end
