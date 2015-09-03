require 'byebug'

#Phase 1: O(n!)
def anagram_1?(str1, str2)
  first_anagram(str1).include?(str2)
end

def first_anagram(str)
  return [str] if str.length < 2
  anagrams = []
  str.split("").each.with_index do |char, i|
    arr_of_chars = str.chars
    arr_of_chars.delete_at(i)
    str_without_char = arr_of_chars.join
    anagrams += first_anagram(str_without_char).map do |word|
      char + word
    end
  end
  anagrams
end

# Phase 2: O(n)
def anagram_2(str1, str2)
  return false if str1.length != str2.length
  str1_arr = str1.chars
  str2_arr = str2.chars
  str1.length.times do |i|
    char = str1[i]
    str1_arr.delete(char)
    str2_arr.delete(char)
  end
  str1_arr.empty? && str2_arr.empty?
end
