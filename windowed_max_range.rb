# Naive Solution: O(n^2) because worst case is w = n/2
def windowed_max_range_1(arr, w)
  current_max_range = nil
  arr_copy = arr.dup
  until arr_copy.length < w
    window = arr_copy.first(w)
    min = window.first
    max = window.first
    window.each do |el|
      min = el if min > el
      max = el if max < el
    end
    range = max - min
    current_max_range ||= range
    if current_max_range < range
      current_max_range = range
    end
    arr_copy = arr_copy.drop(1)
  end
  current_max_range
end

# O(n) solution using min_max_stack_queue
require_relative 'min_max_stack_queue'
def windowed_max_range(nums, window)
  q = MinMaxStackQueue.new
  max_range = nil
  hit_window_size = false
  nums.each.with_index do |num, i|
    q.enqueue(num)
    q.dequeue if q.size > window
    if q.size == window
      cur_range = q.max - q.min
      max_range ||= cur_range
      max_range = cur_range if cur_range > max_range
    end
  end
  max_range
end


# adding Time.now - start_time at the end of each
# a = Array.new(10000, 3)
# [15] pry(main)> t1 = windowed_max_range_1(a, a.length / 2)
# => 2.594872
# [16] pry(main)> t2 = windowed_max_range(a, a.length / 2)
# => 0.044519
#
# a = Array.new(50000, 5)
# t1 = windowed_max_range_1(a, a.length / 2)
# => 64.941744
# [22] pry(main)> t2 = windowed_max_range(a, a.length / 2)
# => 0.216003
#
# At smaller windows and at windows almost == length,
# naive solution performs better
# [29] pry(main)> windowed_max_range_1(a, a.length)
# => 0.006312
# [30] pry(main)> windowed_max_range(a, a.length)
# => 0.126068
# [31] pry(main)> windowed_max_range(a, 2)
# => 0.302136
# [32] pry(main)> windowed_max_range_1(a, 2)
# => 0.059344
