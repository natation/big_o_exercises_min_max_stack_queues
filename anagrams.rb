require 'byebug'

#Phase 1
def anagram_1?(str1, str2)
  first_anagram(str1).include?(str2)
end

def first_anagram(str)
  return [str] if str.length < 2
  anagrams = []
  str.split("").each.with_index do |char, i|
    # debugger
    arr_of_chars = str.chars
    arr_of_chars.delete_at(i)
    str_without_char = arr_of_chars.join
    anagrams += first_anagram(str_without_char).map do |word|
      char + word
    end
  end
  anagrams
end
