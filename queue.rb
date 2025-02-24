class MyStack
    def initialize()
      @root = nil
    end


=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
      new_e = Element.new(x)
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


=begin
    :rtype: Boolean
=end
    def empty()
      @root.nil?
    end

   class Element
    attr_accessor :val, :next

     def initialize(val)
       @val = val
       @next = nil
     end
   end
end

# Your MyStack object will be instantiated and called as such:
obj = MyStack.new()
obj.push(5)
obj.push(4)
obj.push(3)
puts obj.pop()
puts  obj.top()
puts obj.pop()
puts obj.pop()
puts  obj.empty()