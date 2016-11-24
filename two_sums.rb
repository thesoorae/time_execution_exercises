def bad_two_sum?(arr, target)
  arr[0..-2].each_with_index do |el1, idx|
    arr[(idx+1)..-1].each do |el2|
      return true if el1 + el2 == target
    end
  end
  return false
end

def okay_two_sum?(arr, target)
  arr.sort!
  low_idx = 0
  high_idx = arr.length-1
  until low_idx > high_idx
    low = arr[low_idx]
    high = arr[high_idx]
    current_sum = low + high
    if current_sum == target
      return true
    elsif current_sum > target
      high_idx -=1
    else
      low_idx +=1
    end
  end
return false
end

def best_sum?(arr, target)
  hash = Hash.new{0}
  arr.each_with_index do |el, idx|
    hash[el] = idx
  end

  pos = hash.select { |k,v| k <= target }
  pos.each do |num, _|
    difference = target - num
    return true if pos.has_key?(difference)
  end
  return false

end
