require_relative "./key_generator"

class Encrypt

  attr_accessor :encrypted_msg, :keymap

  def initialize
    @encrypted_msg = []
    @keymap = "abcdefghijklmnlopqrstuvwxyz0123456789,. ".chars
  end        # 0123456789012345678901234567890123456789

  def encrypt_message(string, rotation_collection)
    # string.gsub!(/[^0-9a-z]/, '')                                                    # => "hellomomend"
    index = 0
    string.chars.each do |character|
      encrypted_msg << encrypt_character(character, rotation_collection[index % 4])
      index += 1
    end
    encrypted_msg.join
  end

  def encrypt_character(character, rotation)
    pos_of_char = keymap.index(character.downcase)
    new_encrypted_char = (pos_of_char + rotation) % keymap.size
    keymap[new_encrypted_char]
  end

end


if __FILE__==$0
  test = Encrypt.new
  test_key = KeyGenerator.new
  #test.encrypt_message('d2v1l',[-18, -34, -26, -10])
  test.encrypt_message("8pc1nnl6nh",  [-15, -9, -1, -30])
end
