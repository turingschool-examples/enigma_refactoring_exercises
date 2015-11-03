require_relative './encrypt'
require_relative './key_generator'
require_relative './offset_calc'
require "date"

class Decrypt

  attr_accessor :input, :key, :date, :decrypted_message, :formatted_date, :final_key

  def default_date
    Date.today.strftime("%y%m%d")
  end

  def initialize(key, date = default_date, input_file_name = "./lib/decrypted.txt")
    get_file(input_file_name)
    @key = format_the_key(key)
    @date = format_date(date.to_i)
    @formatted_date = formatted_date
    @decrypted_message = decrypted_message
    @final_key = final_key
  end

  def get_file(input_file_name)
    incoming_file = File.open(input_file_name, "r")
    @input = incoming_file.read.chomp
    incoming_file.close
  end

  def write_to_file
    writer = File.open(ARGV[1], "w")
    writer.write(@decrypted_message)
  end

  def format_the_key(key)
    if key.length != 5
      "Please enter a valid key"
    else
      @key = key.chars.map do |i|
        i.to_i
      end
    end
  end

  def turn_key_to_paired_key
    offset_runner = KeyGenerator.new
    @key = offset_runner.ext_rotation_collector(@key)
  end

  def reverse_the_key
    @key = @key.map do |pair|
      pair * -1
    end
  end

  def format_date(date)
    @date = date * date
    @formatted_date = @date.to_s[-4,4].chars.map { |i| i.to_i }
  end

  def make_final_key
    turn_key_to_paired_key
    offset_runner = Offset.new
    @final_key = offset_runner.external_offset_calc(@key, @formatted_date)

  end

  def decrypt
    encrypt_runner = Encrypt.new
    @decrypted_message = encrypt_runner.encrypt_message(@input, @final_key)
    puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
  end

  def output
    writer = File.open(ARGV[1], "w")
    writer.write(@decrypted_message)
    writer.close
  end

  def final_run
    make_final_key
    reverse_the_key
    decrypt
    output
  end
end

if __FILE__==$0
  decrypt_runner = Decrypt.new
  decrypt_runner.final_run
end
