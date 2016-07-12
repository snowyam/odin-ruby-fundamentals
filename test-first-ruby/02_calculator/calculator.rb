#write your code here
def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(array)
  sum = 0
  array.each { |x| sum += x}
  return sum
end

def multiply(array)
  product = 1
  array.each { |x| product *= x}
  return product
end

def power(a, b)
  a**b
end

def factorial(n)
  if n <= 1
    return 1
  else 
    return (n * factorial(n - 1))
  end
end