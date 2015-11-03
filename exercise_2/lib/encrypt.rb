require_relative "./key_generator"

class Encrypt

  attr_accessor :encrypted_msg, :keymap

  def initialize
    @encrypted_msg = []
    @keymap = "abcdefghijklmnlopqrstuvwxyz0123456789,. ".chars
  end

  def encrypt_message(string, rotation_collection)
    index = 0
    string.chars.each do |character|
      case index
      when 0
        encrypted_msg << encrypt_character(character, rotation_collection[0])
      when 1
        encrypted_msg << encrypt_character(character, rotation_collection[1])
      when 2
        encrypted_msg << encrypt_character(character, rotation_collection[2])
      when 3
        encrypted_msg << encrypt_character(character, rotation_collection[3])
      end
      index += 1
      if index > 3
        index = 0
      end
    end
    encrypted_msg.join
  end

  def encrypt_character(character, rotation)
    pos_of_char = keymap.index(character.downcase)
    new_encrypted_char = (pos_of_char + rotation) % keymap.size
    keymap[new_encrypted_char]
  end

end
