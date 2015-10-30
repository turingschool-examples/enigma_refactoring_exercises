require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_calculator'

class OffsetCalculatorTest < Minitest::Test

  def test_rotation_a_returns_first_two_digits_of_key
    lock = OffsetCalculator.new("12345")
    assert_equal "12", lock.rot_a
  end

  def test_rotation_b_returns_second_and_third_digits_of_key
    lock = OffsetCalculator.new("12345")
    assert_equal "23", lock.rot_b
  end

  def test_rotation_c_returns_third_and_fourth_digits_of_key
    lock = OffsetCalculator.new("12345")
    assert_equal "34", lock.rot_c
  end

  def test_rotation_d_returns_fourth_and_fifth_digits_of_key
    lock = OffsetCalculator.new("12345")
    assert_equal "45", lock.rot_d
  end

  def test_offset_a_returns_negative_fourth_digit_of_date_function
    offset = OffsetCalculator.new("12345", "280715")
    assert_equal "1", offset.off_a
  end

  def test_offset_b_returns_negative_third_digit_of_date_function
    offset = OffsetCalculator.new("12345", "280715")
    assert_equal "2", offset.off_b
  end

  def test_offset_c_returns_negative_second_digit_of_date_function
    offset = OffsetCalculator.new("12345", "280715")
    assert_equal "2", offset.off_c
  end

  def test_offset_d_returns_negative_first_digit_of_date_function
    offset = OffsetCalculator.new("12345", "280715")
    assert_equal "5", offset.off_d
  end

  def test_a_rotation_is_sum_of_rotation_a_and_offset_a
    rotation = OffsetCalculator.new("12345", "280715")
    assert_equal rotation.rot_a.to_i + rotation.off_a.to_i, rotation.a_rotation
  end

  def test_b_rotation_is_sum_of_rotation_b_and_offset_b
    rotation = OffsetCalculator.new("12345", "280715")
    assert_equal rotation.rot_b.to_i + rotation.off_b.to_i, rotation.b_rotation
  end

  def test_c_rotation_is_sum_of_rotation_c_and_offset_c
    rotation = OffsetCalculator.new("12345", "280715")
    assert_equal rotation.rot_c.to_i + rotation.off_c.to_i, rotation.c_rotation
  end

  def test_d_rotation_is_sum_of_rotation_d_and_offset_d
    rotation = OffsetCalculator.new("12345", "280715")
    assert_equal rotation.rot_d.to_i + rotation.off_d.to_i, rotation.d_rotation
  end

end
