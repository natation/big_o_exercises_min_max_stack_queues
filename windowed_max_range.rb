# Naive Solution: O(n^2) because worst case is w = n/2 
def windowed_max_range(arr, w)
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
