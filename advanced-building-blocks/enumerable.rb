# Enumerable Methods

module Enumerable

  def my_each
    if block_given?
      i = 0
      array = self.to_a
      while i < self.length
        yield(array[i])
        i += 1
      end
    else
      self.to_enum
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      array = self.to_a
      while i < self.length
        yield(array[i], i)
        i += 1
      end
    else
      self.to_enum
    end
  end

  def my_select
    if block_given?
      i = 0
      array = []
      while i < self.length
        if yield(self[i]) == true
          array << self[i]
        end
        i += 1
      end
      return array
    else
      self.to_enum
    end
  end

  def my_all?
    if block_given?
      i = 0
      bool = true
      while i < self.length
        if yield(self[i]) != true
          bool = false
        end
        i += 1
      end
      return bool
    else
      self.to_enum
    end
  end

  def my_any?
    if block_given?
      i = 0
      bool = false
      while i < self.length
        if yield(self[i]) == true
          bool = true
        end
        i += 1
      end
      return bool
    else
      self.to_enum
    end
  end

  def my_none?
    if block_given?
      i = 0
      bool = true
      while i < self.length
        if yield(self[i]) == true
          bool = false
        end
        i += 1
      end
      return bool
    else
      i = 0
      bool = true
      while i < self.length
        if self[i] == true
          bool = false
        end
        i += 1
      end
      return bool
    end
  end

  def my_count(argv = nil)
    count = 0
    i = 0
    if block_given?
      while i < self.length
        if yield(self[i]) == true
          count += 1
        end
        i += 1
      end
    elsif argv.nil?
      count = self.length  
    else
      while i < self.length
        if self[i] == argv
          count += 1
        end
        i += 1
      end  
    end
    return count
  end

  def my_map(proc = nil)
    i = 0
    array = []
    if proc != nil
      while i < self.length
        array << proc.call(self[i])
        i += 1
      end
    elsif block_given?
      while i < self.length
        array << yield(self[i])
        i += 1
      end
    else
      self.to_enum
    end
    return array
  end

  def my_inject(argv = nil)
    i = 0
    if block_given?
      if argv.nil?
        memo = self[0]
      else
        memo = argv
      end
      while i < self.length - 1
        memo = yield(memo, self[i + 1])
        i += 1
      end
    else
      self.to_enum
    end
    memo
  end

end

# The required inject test function
def multiply_els(array)
  array.my_inject do | memo, num |
    memo *= num
  end
end

# Basic Inline Tests, RSpec in another project.

array = [2, 4, 6]
hash = {one: "uno", two: "dos"}

#each

array.my_each do |x|
  puts x
end

hash.my_each do |x|
  puts x
end

array.each do |x|
  puts x
end

hash.each do |x|
  puts x
end

#each_with_index

array.my_each_with_index do |element, index|
  puts "#{element} #{index}"
end

array.each_with_index do |element, index|
  puts "#{element} #{index}"
end

#select

my_selected = array.my_select { |x| x % 4 == 0 }

puts my_selected

selected = array.select { |x| x % 4 == 0 }

puts selected

#all?

puts array.my_all? { |x| x % 2 == 0 }

puts array.all? { |x| x % 2 == 0 }

#any?

puts array.my_any? { |x| x == 3 }

puts array.any? { |x| x == 3 }

#none?

puts array.my_none? { |x| x > 8 }

puts array.none? { |x| x > 8 }

puts [nil].my_none?

puts [nil].none?

#count

puts array.my_count
puts array.my_count(2)
puts array.my_count { |x| x % 4 == 0}

puts array.count
puts array.count(2)
puts array.count { |x| x % 4 == 0}

#map

my_proc = Proc.new { |x| print "#{x}" }

p array.my_map { |i| i*i }

p array.my_map(&my_proc)

p array.map { |i| i*i }

p array.map(&my_proc)

#inject

puts multiply_els(array)

injected = array.inject do | memo, num |
  memo *= num
end

puts injected