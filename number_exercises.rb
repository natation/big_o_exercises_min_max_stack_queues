# O(n) time complexity
def my_min(list)
  smallest_num = list.first
  list.length.times do |i|
    smallest_num = list[i] if list[i] < smallest_num
  end
  smallest_num
end

def largest_contiguous_subsum(list)
  largest = list.first
  cur_sum = largest < 0 ? largest : 0
  list.length.times do |i|
    if list[i] < 0
      largest = cur_sum if largest < cur_sum
      cur_sum = 0
    else
      cur_sum += list[i]
    end
  end
  largest < cur_sum ? cur_sum : largest
end
