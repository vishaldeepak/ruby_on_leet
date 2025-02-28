require 'debug'

def compare_version(version1, version2)
  
  v1_index = 0
  v2_index = 0
  while(true)
    str1 = get_element_till_dot(version1, v1_index)
    v1_index += str1.size + 1
    str2 = get_element_till_dot(version2, v2_index)
    v2_index += str2.size + 1

    str1 = str1.to_i
    str2 = str2.to_i

    return -1 if str1 < str2
    return 1 if str1 > str2

    break if v1_index >= version1.size && v2_index >= version2.size
  end
  0
end

def get_element_till_dot(s, index)
  arr = []
  (index..s.length-1).each do |inner_index|
    break if s[inner_index] == "."

    arr.push(s[inner_index])
  end

  arr.join
end

puts compare_version("1.0.0.0.1","1.0.0.0")