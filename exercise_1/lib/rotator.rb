class Rotator
  def initialize(rotations, character_map) # e.g. [13, 25, 36, 50]
    @rotations = rotations
    @char_map = character_map
  end

  def rotate(character, index, direction = :forward)
    start_index = @char_map.index(character)
    current_offset = @rotations[index]
    puts "character: #{character.inspect}"
    puts "char map: #{@char_map}"
    if direction == :forward
      @char_map.rotate(current_offset)[start_index]
    else
      @char_map.rotate(-current_offset)[start_index]
    end
  end
end
