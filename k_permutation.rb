def get_permutation(n, k)
  value_array = [] 
  n.times do |i|
    value_array.push(i+1)
  end  
  @ans=nil
  @count_hit= 0

  permute(value_array, 0, n-1,k)
  @ans
end


def permute(value_array, start_index, end_index, k)
  return unless @ans.nil?
  
  if start_index == end_index
    @count_hit += 1
    if(@count_hit == k)
      @ans = value_array.join
    end
  else
    (start_index..end_index).each do |i|
      value_array[start_index], value_array[i] = value_array[i], value_array[start_index]
      permute(value_array, start_index+1, end_index, k)
      return unless @ans.nil?
      value_array[start_index], value_array[i] = value_array[i], value_array[start_index]
    end
  end
end

puts get_permutation(4, 9)