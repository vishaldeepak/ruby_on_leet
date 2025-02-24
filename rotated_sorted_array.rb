def search(nums, target)
  low = 0 
  high = nums.size-1

  while(low <= high )
    mid = low + (high - low)/2
    mid_val = nums[mid]

    return mid if target == mid_val

    high_val = nums[high]
    low_val = nums[low]

    if(mid_val < high_val)
      if(target.between?(mid_val, high_val))
        low = mid+1
      else
        high = mid - 1
      end
    else
      if(target.between?(low_val, mid_val))
        high = mid - 1 
      else
        low = mid + 1
      end
    end
  end
  -1
end

puts search([6,7,0,1,2,4,5],0)
