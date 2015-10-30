require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_it_creates_5_digit_key
    skip
    key_generator = KeyGenerator.new(100)
    assert_equal [8, 8, 3, 7, 7], key_generator.generate
  end

  def test_it_generates_key_only_once
    skip
    key_generator = KeyGenerator.new(100)
    assert_equal [8, 8, 3, 7, 7], key_generator.generate
    assert_equal [8, 8, 3, 7, 7], key_generator.generate
  end

  def test_it_has_a_class
    assert key = KeyGenerator.new
  end

  def test_when_random_num_is_called_5_digit_integer_is_created
    n = KeyGenerator.new
    return_value = n.randomize_5_digits
    assert_equal 5, return_value.length
  end

  def test_all_rotations_have_a_value
    n = KeyGenerator.new
    n.rotations.each do |key, value|
      assert n.rotations[key]
    end
  end
  
end
