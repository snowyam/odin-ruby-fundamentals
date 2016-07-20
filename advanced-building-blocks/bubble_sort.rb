# Bubble Sort

def bubble_sort(array)
  unsorted = array.length - 1
  while unsorted != 0
    array.each_with_index do |element, index|
      if index < unsorted
        if element > array.fetch(index + 1)
          array[index], array[index + 1] = array[index + 1], array[index]
        end
      end
    end
    unsorted -= 1
  end
  p array
end

def bubble_sort_by(block)
  unsorted = block.length - 1
  while unsorted != 0
    block.each_with_index do |element, index|
      if index < unsorted
        if yield(element, block.fetch(index + 1)) > 0
          block[index], block[index + 1] = block[index + 1], block[index]
        end
      end
    end
    unsorted -= 1
  end
  p block
end

# Given example tests
bubble_sort([4,3,78,2,0,2])

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end