require 'minitest/autorun'
require 'minitest/pride'
require "./lib/crack"

class CrackTest< Minitest::Test

  def test_it_grabs_last_4_chars_of_message
    crack_runner = Crack.new("qwerqwerpod")
    result = ["r", "p", "o", "d"]
    assert_equal result, crack_runner.last_four
  end

  def test_it_can_handle_short_possioble_input
    crack_runner = Crack.new("..end..")
    result = ["n", "d", ".", "."]
    assert_equal result, crack_runner.last_four
  end

  def test_that_offset_amount_doesnt_change_when_string_is_mult_of_4
    crack_runner = Crack.new("qwerqwer")
    result = nil
    assert_equal result, crack_runner.set_rotation_offset
  end

  def test_that_offset_changes_offest_set_to_3_when_string_ends_on_A
    crack_runner = Crack.new("thisendsa")
    result = 3
    assert_equal result, crack_runner.set_rotation_offset
  end

  def test_that_offset_changes_to_1_when_string_ends_on_C
    crack_runner = Crack.new("thisendsinc")
    result = 1
    assert_equal result, crack_runner.set_rotation_offset
  end

  def test_it_pairs_last_four_from_message_with_template
    crack_runner = Crack.new("thisendsinc")
    crack_runner.last_four
    crack_runner.set_rotation_offset
    result = [["s", "n"], ["i", "d"], ["n", "."], ["c", "."]]
    assert_equal result , crack_runner.set_pairs
  end

  def test_it_also_works_with_min_length_strings
    crack_runner = Crack.new("..end..")
    crack_runner.last_four
    crack_runner.set_rotation_offset
    result = [["n", "n"], ["d", "d"], [".", "."], [".", "."]]
    assert_equal result , crack_runner.set_pairs
  end

  def test_it_converts_rotation_calues_to_negative
    crack_runner = Crack.new("dmfklmaoir")
    crack_runner.last_four
    crack_runner.set_rotation_offset
    crack_runner.set_pairs
    result = [-27, -12, -10, -20]
    assert_equal result , crack_runner.find_rotation_distance
  end

  def test_that_it_provides_rotation_distances
    crack_runner = Crack.new("m xyq ro6b4wqbyo6b")
    crack_runner.last_four
    crack_runner.set_rotation_offset
    crack_runner.set_pairs
    result = [-12, -12, -35, -3]
    assert_equal result , crack_runner.find_rotation_distance
  end

  def test_that_it_provides_rotation_distances_with_long_string
    crack_runner = Crack.new("nd,6rd4w7fe4rf.w7f 6ol,8w1gz3i.2or.w7q6sui")
    crack_runner.last_four
    crack_runner.set_rotation_offset
    crack_runner.set_pairs
    result = [-20, -16, -23, -10]
    assert_equal result , crack_runner.find_rotation_distance
  end

  def test_that_it_provides_rotation_distances_with_shortest_possible_string
    crack_runner = Crack.new("nd,6rd4")
    crack_runner.last_four
    crack_runner.set_rotation_offset
    crack_runner.set_pairs
    result = [-20, -15, -5, -33]
    assert_equal result , crack_runner.find_rotation_distance
  end

  def test_it_shifts_key_to_ABCD_order_when_while_string_is_mult_of_4
    crack_runner = Crack.new("eol;pspd")
    crack_runner.last_four
    crack_runner.set_rotation_offset
    crack_runner.set_pairs
    crack_runner.find_rotation_distance
    result = [-3, -16, -18, -5]
    assert_equal result, crack_runner.shift_key_to_ABCD_order
  end

  def test_it_shifts_key_to_ABCD_order_when_given_rotation_offsets
    crack_runner = Crack.new("nd,6rd4")
    crack_runner.last_four
    crack_runner.set_rotation_offset
    crack_runner.set_pairs
    crack_runner.find_rotation_distance
    result = [-15, -5, -33, -20]
    assert_equal result, crack_runner.shift_key_to_ABCD_order
  end

  def test_it_uses_encrypt_class_to_translate_encrypted_message
    crack_runner = Crack.new("f5cqdu vroy4wos")
    crack_runner.last_four
    crack_runner.set_rotation_offset
    crack_runner.set_pairs
    crack_runner.find_rotation_distance
    crack_runner.shift_key_to_ABCD_order
    result = "you were..end.."
    assert_equal result, crack_runner.send_to_encrypt_class


  end

end
