# Fibonacci

def fibs(number)
  sequence = []
  number.times do |x|
    if x <= 1
      sequence << x
    else
      sequence << sequence[x - 1] + sequence[x - 2]
    end
  end
  p sequence
end

def fibs_rec(number)
  if number <= 1
    return number
  else
    fibs_rec(number - 1) + fibs_rec(number - 2)
  end
end