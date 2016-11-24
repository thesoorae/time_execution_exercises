def windowed_max_range(arr, w)
  window_arrays = []
  (arr.length).times do |idx|
    window_arrays << arr[idx...idx+w] unless (idx+w) > arr.length
  end

  current_max_range = nil
  current_max = window_arrays[0].last - window_arrays[0].first
  window_arrays.each do |subarray|
    p subarray
    subarray.sort!
    diff = subarray.last - subarray.first
    if diff > current_max
      current_max = diff
      # current_max_range = subarray
    end
  end
  current_max
end


class MyQueue

  def initialize
    @store = []
  end

  def enqueue(x)
    @store << x
  end

  def dequeue
    @store.shift
  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    @store == []
  end

end

class MyStack

  def initialize
    @store = []
  end

  def pop
    @store.slice!(-1)
  end

  def push(x)
    @store << x
  end


  def peek
    @store[-1]
  end


  def size
    @store.length
  end


  def empty?
    @store == []
  end
end

class StackQueue

  def initialize
    @store = MyStack.new
  end

  def enqueue(x)
    @store.push(x)
  end

  def dequeue
    new_arr = []
    max = @store.size - 1
    max.times do
      new_arr << @store.pop
    end
    popped = @store
    @store = []

    max.times do
      @store << new_arr.pop
    end

    return popped
  end
end
