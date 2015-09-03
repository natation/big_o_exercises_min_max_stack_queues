# Brute Force: O(n^2)
def bad_two_sum?(arr, target)
  arr.length.times do |i|
    arr.length.times do |j|
      next if i == j
      return true if target == arr[i] + arr[j]
    end
  end
  false
end

# Sorting: O(n * ln (n))
def okay_two_sum?(arr, target)
  sorted = arr.sort
  until sorted.empty?
    num = sorted.first
    sorted = sorted.drop(1)
    return true if sorted.bsearch { |el| target - num <=> el }
  end
  false
end

def two_sum?(arr, target)
  num_hash = Hash.new(0)
  arr.length.times do |i|
    num_hash[arr[i]] += 1
  end

  arr.each do |el|
    next if (target.to_f / el == 2) && num_hash[el] == 1
    return true if num_hash[target - el] > 0
  end
  false
end
