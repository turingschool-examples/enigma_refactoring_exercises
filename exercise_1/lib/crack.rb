require 'pry'
require_relative 'file_io'
require_relative 'character_map'

class Crack

  attr_reader :message, :file_io, :characters, :character_hash

  def initialize
    @file_io = FileIO.new
    @characters = CharacterMap.new.characters
    @character_hash = CharacterMap.new.character_hash
    @message = file_io.message("crack_test.txt")
  end

  def format_message
    message.chomp
  end

  def find_modulo
    format_message.length%4
  end

  def find_rotation(known_char, char_index)
   char_to_crack = format_message[char_index]
   char_to_crack_index = character_hash[char_to_crack]
   known_char_index = character_hash[known_char]
     if char_to_crack_index < known_char_index
       rotation = character_hash.length + (char_to_crack_index - known_char_index)
     elsif char_to_crack_index > known_char_index
       rotation = (char_to_crack_index - known_char_index)
     end
  end

  def rotation_one
    find_rotation("n", -4)
  end

  def rotation_two
    find_rotation("d", -3)
  end

  def rotation_three
    find_rotation(".", -2)
  end

  def rotation_four
    find_rotation(".", -1)
  end

  def final_index
    case find_modulo
    when 0
      Hash["a_rotation", rotation_one, "b_rotation", rotation_two, "c_rotation", rotation_three, "d_rotation", rotation_four]
    when 1
      Hash["b_rotation", rotation_one, "c_rotation", rotation_two, "d_rotation", rotation_three, "a_rotation", rotation_four]
    when 2
      Hash["c_rotation", rotation_one, "d_rotation", rotation_two, "a_rotation", rotation_three, "b_rotation", rotation_four]
    when 3
      Hash["d_rotation", rotation_one, "a_rotation", rotation_two, "b_rotation", rotation_three, "c_rotation", rotation_four]
    end
  end

  def crack_letter_a(letter)
    input = final_index.fetch("a_rotation")
    a_rotated_characters = characters.rotate(-input)
    Hash[characters.zip(a_rotated_characters)][letter]
  end

  def crack_letter_b(letter)
    input = final_index.fetch("b_rotation")
    b_rotated_characters = characters.rotate(-input)
    Hash[characters.zip(b_rotated_characters)][letter]
  end

  def crack_letter_c(letter)
    input = final_index.fetch("c_rotation")
    c_rotated_characters = characters.rotate(-input)
    Hash[characters.zip(c_rotated_characters)][letter]
  end

  def crack_letter_d(letter)
    input = final_index.fetch("d_rotation")
    d_rotated_characters = characters.rotate(-input)
    Hash[characters.zip(d_rotated_characters)][letter]
  end

  def crack(message)
    i = 0
    crack_arr = []
    message_to_crack = message.downcase
    while i < message_to_crack.length
      if i % 4 == 0 || i == 0
        crack_arr << crack_letter_a(message_to_crack[i])
      elsif i % 4 == 1 || i == 1
        crack_arr << crack_letter_b(message_to_crack[i])
      elsif i % 4 == 2 || i == 2
        crack_arr << crack_letter_c(message_to_crack[i])
      elsif i % 4 == 3 || i == 3
        crack_arr << crack_letter_d(message_to_crack[i])
      end
      i += 1
      cracked_input = crack_arr.join
    end
    cracked_input
  end

  def print_message
    "Created '#{ARGV[1]}' with the rotations #{final_index}."
  end

end

if __FILE__ == $0

file_io = FileIO.new
message = file_io.message
c  = Crack.new
file_io.output(c.crack(message))
puts c.print_message

end
