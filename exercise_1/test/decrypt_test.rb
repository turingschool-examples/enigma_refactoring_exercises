require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def test_input_decrypts_a_properly_based_on_rotation
    shift = Decrypt.new("12345", "280715")
    shift.get_rotations
    assert_equal "a", shift.decrypt_letter_a("n")
  end

  def test_input_decrypts_b_properly_based_on_rotation
    shift = Decrypt.new("12345", "280715")
    shift.get_rotations
    assert_equal "a", shift.decrypt_letter_b("z")
  end

  def test_input_decrypts_c_properly_based_on_rotation
    shift = Decrypt.new("12345", "280715")
    shift.get_rotations
    assert_equal "a", shift.decrypt_letter_c(" ")
  end

  def test_input_decrypts_d_properly_based_on_rotation
    shift = Decrypt.new("12345", "280715")
    shift.get_rotations
    assert_equal "a", shift.decrypt_letter_d("l")
  end

  def test_word_decrypts_properly_based_on_4_part_rotation
    decryptor = Decrypt.new("12345", "280715")
    decryptor.get_rotations
    input = "bny,"
    assert_equal "1111", decryptor.decrypt(input)
  end

  def test_input_string_length_equals_output_string_length
    decryptor = Decrypt.new("12345", "280715")
    decryptor.get_rotations
    input = "bny,"
    assert input.length == decryptor.decrypt(input).length
  end

  def test_decrypts_file
    file_io = FileIO.new
    message = file_io.message("decrypt_test.txt")
    decryptor = Decrypt.new("12345", "280715")
    decryptor.get_rotations
    assert_equal "1111", decryptor.decrypt(message)
  end

  def test_prints_output_message_to_command_line
    file_io = FileIO.new
    message = file_io.message("decrypt_test.txt")
    decryptor = Decrypt.new("12345", "280715")
    decryptor.get_rotations
    file_io.output(decryptor.decrypt(message), "decrypt_test_results.txt")
    decryptor.print_message
    assert_equal "Created '' with the key 12345 and date 280715.", decryptor.print_message
  end
end
