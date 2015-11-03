class KeyGenerator

  attr_accessor :random, :rotations

  def initialize(seed = Random.new_seed)
    @random = randomize_5_digits
    # @random_for_testing = Random.new(seed)
    @rotations = [:a, :b, :c, :d].zip(rotation_collector).to_h
  end

  def randomize_5_digits
    5.times.map do
      1 + rand(9)
    end
  end

  # def generate
  #   @key ||= randomize_5_digits
  # end

  def rotation_collector
    rotation_collection =[]
    @random.each_with_index do |num, index|
      if index <= 3
        rotation_collection << [num, random[index + 1]].join
      end
    end
    rotation_collection.map { |index| index.to_i  }
  end

  def ext_rotation_collector(array)
    rotation_collection =[]
    x = array.map.with_index do|num, index|
       if index <= 3
        rotation_collection << [num, array[index + 1]].join
      end
    end
    rotation_collection.map { |index| index.to_i  }
  end
end
