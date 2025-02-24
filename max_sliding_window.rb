require 'debug'

def max_sliding_window(nums, k)
  arr = []
  result = []

  (0..nums.size-1).each do |index|
    arr.shift if(!arr.empty? && arr[0] == index - k) 
    
    while(!arr.empty? && nums[index] >= nums[arr.last])
      arr.pop
    end
    arr.push(index)
    
    
    result.push(nums[arr[0]]) if(index >= k - 1)
  end
  
  
  result
end

result = max_sliding_window([1,3,1,2,0,5], 3)
puts result.inspect