# O(n) time complexity
def my_min(list)
  smallest_num = list.first
  list.length.times do |i|
    smallest_num = list[i] if list[i] < smallest_num
  end
  smallest_num
end

def largest_contiguous_subsum(list)
  return list.first if list.length <= 1
  largest = 0
  cur_sum = 0
  list.length.times do |i|
    if cur_sum + list[i] < 0
      largest = cur_sum if largest < cur_sum
      cur_sum = 0
    else
      cur_sum += list[i]
    end
  end
  largest < cur_sum ? cur_sum : largest
end
