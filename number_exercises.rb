# O(n) time complexity
def my_min(list)
  smallest_num = list.first
  list.length.times do |i|
    smallest_num = list[i] if list[i] < smallest_num
  end
  smallest_num
end

def largest_contiguous_subsum(list)
  list_of_lists = []
  list.length.times do |start|
    (start...list.length).each do |stop|
      list_of_lists << list[start..stop]
    end
  end
  list_of_sums = list_of_lists.map {|list| list.inject(:+) }
  largest = list_of_sums.first
  list_of_sums.each do |num|
    largest = num if num > largest
  end
  largest
end
