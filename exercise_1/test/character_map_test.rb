require 'minitest/autorun'
require 'minitest/pride'
require './lib/character_map'

class CharacterMapTest < Minitest::Test

  def test_character_map_is_39_characters
    character_map = CharacterMap.new.characters
    assert character_map
    assert_equal 39, character_map.count
  end

  def test_character_hash_is_39_key_value_pairs
    character_hash = CharacterMap.new.character_hash
    assert character_hash
    assert_equal 39, character_hash.count
  end

  def test_key_returns_corresponding_value
    character_hash = CharacterMap.new.character_hash
    assert_equal 1, character_hash.fetch("a")
  end

end
