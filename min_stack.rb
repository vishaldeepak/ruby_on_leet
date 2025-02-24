class MyStack
  def initialize()
    @root = nil
    @min = nil
  end

=begin
  :type x: Integer
  :rtype: Void
=end
  def push(x)
    if @root.nil?
      min_till_now = x
    else
      min_till_now = [x, @root.min_till_now].min
    end
    new_e = Element.new(x, min_till_now)
    new_e.next = @root
    @root = new_e
  end


=begin
  :rtype: Integer
=end
  def pop()
    element = @root.val
    @root = @root.next
    element
  end

=begin
  :rtype: Integer
=end
  def top()
    @root&.val
  end

  def get_min()
    @root&.min_till_now
  end    

 class Element
  attr_accessor :val, :next, :min_till_now

   def initialize(val, min_till_now)
     @val = val
     @next = nil
     @min_till_now = min_till_now
   end
 end
end


# Your MinStack object will be instantiated and called as such:
obj = MyStack.new()
obj.push(5)
obj.push(4)
obj.push(9)
obj.push(2)
obj.push(8)
puts obj.pop()
puts obj.get_min
puts  obj.top()
puts obj.get_min
puts obj.pop()
puts obj.get_min
puts obj.pop()
puts obj.get_min
