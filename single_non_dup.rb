require 'debug'
def single_non_duplicate(nums)
  helper(nums, 0, nums.size-1) 
end


def helper(nums, low,high)
 mid = low + ((high-low)/2)
 val = nums[mid]

 return val if mid == 0 && nums[mid+1] != val

 return val if mid == high && nums[mid-1] != val

 return val if nums[mid+1] != val && nums[mid-1] != val
   

 if mid.even?
   if nums[mid-1] == nums[mid]
     return helper(nums, low, mid-1)
   else
     return helper(nums, mid+1, high)
   end
 else
   if nums[mid-1] == nums[mid]
     return helper(nums, mid+1, high)
   else
     return helper(nums, low, mid-1)
   end
 end
end

# puts single_non_duplicate([1,1,2,3,3,4,4,8,8]
puts single_non_duplicate([1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9])