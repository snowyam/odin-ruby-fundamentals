# Stock Picker

def stock_picker(array)
  high = 0
  picker = []

  array.each do |e|
    compare = array[array.index(e)...-1]
    compare.each do |i|
      if i - e > high
        high = i - e
        picker = [array.index(e), array.index(i)]
      end
    end
  end
  p picker
end

stock_picker([17,3,6,9,15,8,6,1,10])