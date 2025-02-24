require 'debug'

class MinHeap 
  attr_accessor :size, :arr

  def initialize
    @size = 0
    @arr = []
  end

  def insert(value)
    self.arr[size] = value
    self.size += 1
    adjust_insert_position(size-1)
  end

  def delete_min()
    return if size == 0
    
    @arr[0] = arr[size-1]
    @arr[size-1] = nil
    self.size -= 1
    adjust_delete_position()
  end

  def iterate
    puts arr.inspect
  end

  private 

  def adjust_delete_position()
    base_position = 0
    left_child_pos = (2*base_position) + 1 
    
    while(left_child_pos < (size-1))
      index = smaller_child_index(left_child_pos)
      swap(index,base_position)
      base_position = index
      left_child_pos = (2*base_position) + 1 
    end
  end

  def smaller_child_index(left_child_pos)
    return if left_child_pos+1 >= size

    return left_child_pos if arr[left_child_pos] <= arr[left_child_pos+1]

    return left_child_pos+1
  end

  def adjust_insert_position(pos)
    return if pos == 0

    parent_pos = parent_index(pos)

    if arr[pos] < arr[parent_pos]
      swap(parent_pos, pos)
      adjust_insert_position(parent_pos)
    end
  end

  def swap(parent_index, pos)
    temp = @arr[pos]
    @arr[pos] = @arr[parent_index]
    @arr[parent_index] = temp
  end

  def parent_index(pos)
    (pos-1)/2
  end
end

x=MinHeap.new()
x.insert(10)
x.insert(3)
x.insert(5)
x.insert(15)
x.insert(7)
x.delete_min

puts x.iterate