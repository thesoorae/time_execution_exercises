require 'byebug'
def my_min_slow(arr)

  arr.each_with_index do | out_el , idx |
    lowest = true
    arr.each_with_index do | in_el, idx2 |
      next if idx == idx2
      lowest = false if out_el > in_el
    end
    return out_el if lowest
  end
end

def my_min(arr)
  lowest = arr.first
  arr.each do |el|
    lowest = el if el < lowest
  end
  lowest
end

def sub_sum_slow(arr)
largest = arr.first
sub_arrays = []
  arr.each_with_index do |out_el, idx|
    arr.each_with_index do |in_el, idx2|
      next if idx2 < idx
      sub_arrays << arr[idx..idx2]
    end
  end
  sub_arrays.each do |sub_array|
    current = sub_array.inject(:+)
    largest = current if current > largest
  end
  largest
end

def sub_sum(arr)
  current_sum = arr.first
  prev_sum = arr.first
  largest = arr.first

  (1...arr.length).each do |idx|
    num = arr[idx]
    current_sum = num + prev_sum
    if current_sum > num
      prev_sum = current_sum
    else
      prev_sum = num
    end
    largest = prev_sum if prev_sum > largest
  end
  largest
end
