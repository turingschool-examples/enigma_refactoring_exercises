require_relative "offset_generator"
require 'pry'

class OffsetCalculator

  attr_reader :key, :offset, :date

  def initialize(key = nil, date = nil)
    if key.nil?
      @key = get_key
    else
      @key = key
    end

    if date.nil?
      @date = Time.now.strftime("%d%m%y")
    else
      @date = date
    end
    @offset = get_offset
  end

  def get_key
    OffsetGenerator.new.generate_key
  end

  def get_offset
    OffsetGenerator.new.generate_offset(date)
  end

  def rot_a
    key[0..1]
  end

  def rot_b
    key[1..2]
  end

  def rot_c
    key[2..3]
  end

  def rot_d
    key[3..4]
  end

  def off_a
    offset[-4]
  end

  def off_b
    offset[-3]
  end

  def off_c
    offset[-2]
  end

  def off_d
    offset[-1]
  end

  def a_rotation
    rot_a.to_i + off_a.to_i
  end

  def b_rotation
    rot_b.to_i + off_b.to_i
  end

  def c_rotation
    rot_c.to_i + off_c.to_i
  end

  def d_rotation
    rot_d.to_i + off_d.to_i
  end

  def rotations
    [a_rotation, b_rotation, c_rotation, d_rotation]
  end
end
