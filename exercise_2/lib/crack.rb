require_relative './encrypt'

class Crack

  attr_accessor :input, :final_key, :cracked_message

  def initialize(input = get_file)
    @input = input
    @keymap = "abcdefghijklmnlopqrstuvwxyz0123456789,. ".chars.reverse
    @template = "nd.."
    @rotation_offset = 0
    @final_key = final_key
    @cracked_message = cracked_message
  end

  def get_file
    incoming_file = File.open(ARGV[0], "r")
    @input = incoming_file.read.chomp
    incoming_file.close
  end

  def last_four
    last_four = @input[-4, 4].chars

  end

  def set_rotation_offset

    @rotation_offset = @input.size % 4
    if @rotation_offset == 1
      @rotation_offset = 3
    elsif @rotation_offset == 3
      @rotation_offset = 1
    end
  end

  def set_pairs
    @template = @template.chars
    @paired = last_four.zip(@template)

  end

  def find_rotation_distance
    @final_key = @paired.map do |pair|
      start = @keymap.index(pair.first)
      ending = @keymap.index(pair.last)
      if start > ending
        -(@keymap.size - (start - ending ))
      else
       -(ending - start)
      end
    end
  end

  def shift_key_to_ABCD_order
    @final_key = @final_key.rotate(@rotation_offset)
  end


  def send_to_encrypt_class
    encrypt_runner = Encrypt.new
    @cracked_message = encrypt_runner.encrypt_message(@input, @final_key)
  end

  def write_file
    writer = File.open(ARGV[1], "w")
    writer.write(@cracked_message)
    writer.close
  end
end


if __FILE__==$0
  crack_runner = Crack.new
  crack_runner.get_file
  crack_runner.last_four
  crack_runner.set_rotation_offset
  crack_runner.set_pairs
  crack_runner.find_rotation_distance
  crack_runner.shift_key_to_ABCD_order
  crack_runner.send_to_encrypt_class
  crack_runner.write_file
end
