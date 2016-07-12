class Timer
  #write your code here
  attr_accessor :seconds

  def padded(digit)
    "#{digit}".rjust(2, '0')
  end

  def initialize
    @seconds = 0
  end

  def time_string
    formatted = 0
    if @seconds < 60
      formatted = "00:00:" << padded(@seconds)
      @seconds = formatted
    elsif @seconds < 3600
      formatted = "00:" << padded(@seconds / 60) << ":"
      formatted << padded(@seconds % 60)
      @seconds = formatted
    else
      formatted = padded(@seconds / 3600) << ":"
      formatted << padded(@seconds % 3600 / 60) << ":"
      formatted << padded(@seconds % 3600 % 60)
    end
  end

end
