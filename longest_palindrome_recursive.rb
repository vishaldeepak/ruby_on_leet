# Doesnt pass tests, but similar Java program does

require 'debug'

# @param {String} s
# @return {String}
def longest_palindrome(s)
  dynamic_arr = []    
  (0..s.length-1).each do |index|
    dynamic_arr[index] = []
    (index..s.length-1).each do |inner_index|
      dynamic_arr[index][inner_index] = -1
    end
    dynamic_arr[index][index] = 1
  end

  max = 0
  pos = []

  

  (0..s.length-1).each do |index|
    (s.length-1).downto(index).each do |inner_index|
      ans = recursive_find(index, inner_index, dynamic_arr, s)
      if(ans > max)
        pos = [index, inner_index]
        max = ans  
      end
    end
  end

  s.slice(pos[0]..pos[1])
end

def recursive_find(start, end_point, dynamic_array, s)
  val = dynamic_array[start][end_point]
  return val if val != -1 
  if s[start] != s[end_point]
    dynamic_array[start][end_point] = 0
    return 0 
  end

  if start+1 == end_point
    dynamic_array[start][end_point] = 2
    return 2
  end

  ans = recursive_find(start+1, end_point-1, dynamic_array, s)
  
  if ans == 0
    dynamic_array[start][end_point] = ans
    return 0 
  else
    dynamic_array[start][end_point] = ans + 2
    return ans + 2
  end
end

puts longest_palindrome("maxxamaam")