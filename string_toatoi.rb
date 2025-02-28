require 'debug'

def my_atoi(s)
    s = s.lstrip

    is_positive = true
    is_positive = false if s[0] == "-"
    
    start = 0 
    start = 1 if s[0] == "-" || s[0] == "+"
    res = []
    (start..s.length-1).each do |index|
      char = s[index]

      if char == "0"
        next if res.empty?
        res.push(char)
      elsif char.to_i == 0
        break
      else
        res.push(char)
      end
    end

    max = 2.pow(31)

    if res.size > 10
      max_values(is_positive, max)
    end

    res = res.join.to_i
    res = res * -1 unless is_positive

    return max - 1 if res >= (max - 1)
    return max * -1  if res <= (-1 * max) 

    res
end

def max_values(is_positive, max)
  return max - 1 if is_positive
  return max * -1  
end


puts my_atoi("mana")
puts my_atoi("42")
puts my_atoi(" -042")
puts my_atoi("1337c0d3")
puts my_atoi("0-1")
puts my_atoi("words and 987")
puts my_atoi("2341241234214123421")