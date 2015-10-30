require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'

class CrackTest < Minitest::Test

  def test_crack_loads_string_to_crack
    file_io = FileIO.new
    message = file_io.message("crack_test.txt")
    crack   = Crack.new
    assert message
  end

  def test_returns_proper_modulo_four_of_string_length
    file_io = FileIO.new
    message = file_io.message("crack_test.txt")
    crack   = Crack.new
    assert_equal 3, crack.find_modulo
  end

  def test_it_finds_correct_last_letter_rotation
    file_io = FileIO.new
    message = file_io.message("crack_test.txt")
    crack   = Crack.new
    assert_equal Hash["d_rotation"=>11, "a_rotation"=>13, "b_rotation"=>25, "c_rotation"=>36], crack.final_index
  end

  def test_crack_finds_distance_from_first_known_character_to_encrypted
    file_io = FileIO.new
    message = file_io.message("crack_test.txt")
    crack   = Crack.new
    crack.rotation_one
    known_char = "n"
    char_index = -4
    assert_equal 11, crack.find_rotation(known_char, char_index)
  end

  def test_crack_finds_distance_from_second_known_character_to_encrypted
    file_io = FileIO.new
    message = file_io.message("crack_test.txt")
    crack   = Crack.new
    crack.rotation_one
    known_char = "d"
    char_index = -3
    assert_equal 13, crack.find_rotation(known_char, char_index)
  end

  def test_crack_finds_distance_from_third_known_character_to_encrypted
    file_io = FileIO.new
    message = file_io.message("crack_test.txt")
    crack   = Crack.new
    crack.rotation_one
    known_char = "."
    char_index = -2
    assert_equal 25, crack.find_rotation(known_char, char_index)
  end

  def test_crack_finds_distance_from_fourth_known_character_to_encrypted
    file_io = FileIO.new
    message = file_io.message("crack_test.txt")
    crack   = Crack.new
    crack.rotation_one
    known_char = "."
    char_index = -1
    assert_equal 36, crack.find_rotation(known_char, char_index)
  end

  def test_final_index_returns_proper_hash_based_on_text_input
    file_io = FileIO.new
    message = file_io.message("crack_test.txt")
    crack   = Crack.new
    assert_equal Hash["d_rotation"=>11, "a_rotation"=>13, "b_rotation"=>25, "c_rotation"=>36], crack.final_index
  end

  def test_cracks_file
    file_io = FileIO.new
    message = file_io.message("crack_test.txt")
    c  = Crack.new
    file_io.output(c.crack(message), "crack_test_results.txt")
    assert_equal "..end..", c.crack(message)
  end

  def test_prints_output_message_to_command_line
    file_io = FileIO.new
    message = file_io.message("crack_test.txt")
    c  = Crack.new
    file_io.output(c.crack(message), "crack_test_results.txt")
    assert_equal "Created '' with the rotations {\"d_rotation\"=>11, \"a_rotation\"=>13, \"b_rotation\"=>25, \"c_rotation\"=>36}.", c.print_message
  end


end
