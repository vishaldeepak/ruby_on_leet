def subsets_with_dup(nums)
  result = [[]]
  nums = nums.sort
  prev = nil 
  repeat_size = 0 
  repeat_break = false
  repeat_array = []
  nums.each do |num|
    size = result.size
    if prev == num 
      repeat_size += 1
      repeat_break = true 
      repeat_array = []
      repeat_size.times.each do
        repeat_array.push(num)
      end
    else
      repeat_size = 0
      repeat_break = false
    end

    (0..size-1).each do |index|
      if repeat_break
        next unless repeat_array == result[index]
        repeat_break = false
      end
      cur_result = result[index].dup
      cur_result.append(num)
      result.push(cur_result)
    end
    prev = num 
  end
  result    
end

subsets_with_dup([1,3,3,4]).each do |ans|
  puts ans.join(",")
end