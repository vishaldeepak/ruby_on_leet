# Doesnt pass tests, but similar Java program does
# 
require 'debug'

# @param {String} s
# @return {String}
def longest_palindrome(s)
  dynamic_arr = []    
  (0..s.length-1).each do |index|
    dynamic_arr[index] = []
    (index..s.length-1).each do |inner_index|
      dynamic_arr[index][inner_index] = false
    end
    dynamic_arr[index][index] = true
  end

  max = 0
  pos = []

  (0..s.length-1).each do |index|
    (0..index-1).each do |inner_index|
      if s[index] == s[inner_index] && (index - inner_index <= 2 || dynamic_arr[inner_index+1][index-1])
        
        dynamic_arr[inner_index][index] = true

        if(index - inner_index + 1 > max)
          max = index - inner_index + 1
          pos = [inner_index, index]
        end
      end
    end
  end

  return s[0] if max == 0
  s.slice(pos[0]..pos[1])
end

puts longest_palindrome("ac")