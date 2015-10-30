require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_has_a_class
    e = Enigma.new(text, total_key)
    assert_equal e, Enigma.new
  end
end
