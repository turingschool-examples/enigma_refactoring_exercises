class Time
  attr_accessor :formatted_time
  def formatted_time
    Time.new.strftime("%d%m%y").to_i
  end

end
