require_relative "offset_calculator"
require_relative "file_io"
require_relative "character_map"

class Encrypt

  attr_reader   :rotations, :file_io, :key, :date, :calc, :characters

  def initialize(key = nil, date = nil)
    @date    = date
    @key     = key
    @file_io = FileIO.new
    @calc    = OffsetCalculator.new(key, date)
    @characters = CharacterMap.new.characters
  end

  def get_rotations
    @rotations = calc.rotations
  end

  def encrypt_letter_a(letter)
    a_rotated_characters = characters.rotate(rotations[0])
    Hash[characters.zip(a_rotated_characters)][letter]
  end

  def encrypt_letter_b(letter)
    b_rotated_characters = characters.rotate(rotations[1])
    Hash[characters.zip(b_rotated_characters)][letter]
  end

  def encrypt_letter_c(letter)
    c_rotated_characters = characters.rotate(rotations[2])
    Hash[characters.zip(c_rotated_characters)][letter]
  end

  def encrypt_letter_d(letter)
    d_rotated_characters = characters.rotate(rotations[3])
    Hash[characters.zip(d_rotated_characters)][letter]
  end

  def encrypt(message)
    i = 0
    encrypted_arr = []
    message_to_encrypt = message.downcase
    while i < message_to_encrypt.length
      if i % 4 == 0 || i == 0
        encrypted_arr << encrypt_letter_a(message_to_encrypt[i])
      elsif i % 4 == 1 || i == 1
        encrypted_arr << encrypt_letter_b(message_to_encrypt[i])
      elsif i % 4 == 2 || i == 2
        encrypted_arr << encrypt_letter_c(message_to_encrypt[i])
      elsif i % 4 == 3 || i == 3
        encrypted_arr << encrypt_letter_d(message_to_encrypt[i])
      end
      i += 1
      encrypted_input = encrypted_arr.join
    end
    encrypted_input
  end

  def print_message
    "Created '#{ARGV[1]}' with the key #{calc.key} and date #{calc.date}."
  end
end


if __FILE__ == $0

    file_io = FileIO.new
    message = file_io.message
    encryptor = Encrypt.new
    # ('12345', 280715)
    encryptor.get_rotations
    file_io.output(encryptor.encrypt(message))
    puts encryptor.print_message
end
