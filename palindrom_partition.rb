require 'debug'

def partition(s)
  cur_palindromes = []
  @result = []
  help_partition(s,cur_palindromes)
  @result
end

def help_partition(s, cur_palindromes)
  if s.length == 0 
    @result.push(cur_palindromes.dup)
  end

  (1..s.length).each do |index|
    temp_string = s.slice(0, index)
    next unless is_palindrom(temp_string)

    cur_palindromes.push(temp_string)
    help_partition(s.slice(index, s.length), cur_palindromes)
    cur_palindromes.pop()
  end
  
end

def is_palindrom(value)
  false if value.length == 0
  value == value.reverse
end

ans= partition("aabaa")

puts ans.inspect