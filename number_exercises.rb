# O(n) time complexity
def my_min(list)
  smallest_num = list.first
  list.length.times do |i|
    smallest_num = list[i] if list[i] < smallest_num
  end
  smallest_num
end
