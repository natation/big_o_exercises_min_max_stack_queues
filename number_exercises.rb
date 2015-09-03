def my_min(list)
  list.length.times do |i|
    is_smallest = true
    list.length.times do |j|
      is_smallest = false if list[i] > list[j]
    end
    return list[i] if is_smallest
  end
end
