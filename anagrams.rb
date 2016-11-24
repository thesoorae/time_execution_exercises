
require 'byebug'

def first_anagram(string1, string2)
  string_arr = string1.split('')
  pos = permutations(string_arr).map{ |subs| subs.join('') }
  pos.include?(string2)
end

def permutations(arr)
  return [arr] if arr.length <= 1
  #debugger
  extra = arr.last
  perms = permutations(arr[0..-2])

  new_arr = []
  perms.each do |perm|
    max = perm.length
    (0..max).each do |idx|
      new_perm = perm.dup
      new_arr << new_perm.insert(idx, extra)
    end
  end
  new_arr
end

def second_anagram(string1, string2)
  #debugger
  max = string1.length
    max.times do
    char1 = string1.chars.first
    string2.chars.each_with_index do |char2, idx2|
      if char1 == char2
        string1.slice!(0)
        string2.slice!(idx2, 1)
        break
      end
    end
    return true if string1 == "" && string2 == ""
  end
  return false
end
