require 'minitest/autorun'
require 'minitest/pride'
require "../lib/decrypt"

class DecryptTest < Minitest::Test

  def test_formats_the_key
    decrypt_runner = Decrypt.new("58128")
    result =[5, 8, 1, 2, 8]
    assert_equal result, decrypt_runner.format_the_key
  end

  def test_it_returns_error_when_given_invalid_key
    decrypt_runner = Decrypt.new("8765349")
    result = "Please enter a valid key"
    assert_equal result, decrypt_runner.format_the_key
  end

  def test_it_turns_key_to_rotation_pairs
    decrypt_runner = Decrypt.new("12345")
    decrypt_runner.format_the_key
    result= [12, 23, 34, 45]
    assert_equal result, decrypt_runner.turn_key_to_paired_key
  end

  def test_it_can_properly_format_the_date
    decrypt_runner = Decrypt.new([12345])
    result = 280715
    assert_equal result, decrypt_runner.get_date(280715)
  end

  def test_it_cam_properly_format_date
    decrypt_runner = Decrypt.new([12345])
    decrypt_runner.get_date(280715)
    result = [1,2,2,5]
    assert_equal result, decrypt_runner.format_date
  end

  def test_it_can_make_final_key
    skip
    decrypt_runner = Decrypt.new([12345])
    # decrypt_runner.get_file
    # decrypt_runner.get_key
    decrypt_runner.format_the_key
    decrypt_runner.turn_key_to_paired_key
    decrypt_runner.get_date(280715)
    decrypt_runner.format_date
    result = [12,34,54,34]
    assert_equal result, decrypt_runner.make_final_key
  end


end
