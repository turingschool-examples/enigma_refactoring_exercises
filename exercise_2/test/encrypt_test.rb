#require "simplecov"
# SimpleCov.start
require "minitest/autorun"
require "minitest/pride"
require "./lib/encrypt"

class EncryptTest < Minitest::Test

  def test_it_can_rotate_one_single_letter_when_given_a_value
    encrypt_runner = Encrypt.new
    assert_equal "b", encrypt_runner.encrypt_character("a", 41)
  end

  def test_it_can_handle_uppercase_letters
    encrypt_runner = Encrypt.new
    assert_equal "b", encrypt_runner.encrypt_character("A", 41)
  end

  def test_it_can_encrypt_two_chars
    encrypt_runner = Encrypt.new
    assert_equal "ed", encrypt_runner.encrypt_message("dd", 41)
  end

  def test_it_can_encrypt_three_chars
    encrypt_runner = Encrypt.new
    assert_equal "edd", encrypt_runner.encrypt_message("ddd", 41)
  end

  def test_it_can_handle_special_characters
    encrypt_runner = Encrypt.new
    assert_equal "ielmpmon", encrypt_runner.encrypt_message("hello !@#$%^&* mom", 41)
  end

  def test_it_can_handle_empty_string
    encrypt_runner = Encrypt.new
    assert_equal "", encrypt_runner.encrypt_message("", 41)
  end

end
