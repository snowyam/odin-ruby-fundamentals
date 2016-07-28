def merge_sort(array)
  if array.size <= 1
    return array
  else
    mid = array.size / 2
    left = array[0..mid - 1]
    right = array[mid..-1]
    lefty = merge_sort(left)
    righty = merge_sort(right)
    return merge(lefty, righty)
  end
end

def merge(left, right)
  merged = []

  # Go through both array's first element and compare until empty.
  until left.empty? && right.empty?
    if left.empty? && !right.empty?
      until right.empty?
        merged << right.shift
      end
    elsif right.empty? && !left.empty?
      until left.empty?
        merged << left.shift
      end
    elsif left[0] <= right[0]
      merged << left.shift
    elsif right[0] <= left[0]
      merged << right.shift
    end
  end

  return merged
end

p merge_sort([])
p merge_sort([1])
p merge_sort([2, 1])
p merge_sort([2, 1, 5, 9, 3, 4, 7, 0, 8])
p merge_sort([1,1,1,1,1])