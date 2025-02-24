class StockSpanner
  def initialize()
    @result = []
  end


=begin
  :type price: Integer
  :rtype: Integer
=end
  def next(price)
    span = 1
    while( !@result.empty? && price >= @result.last.val )
      span += @result.last.span
      @result.pop
    end
    elem = Element.new(price, span)
    
    @result.push(elem)
    @result.last.span
  end

  class Element
    attr_reader :val, :span
    def initialize(val, span)
      @val = val
      @span = span
    end
  end
end

e = StockSpanner.new
puts e.next(100)
puts e.next(80)
puts e.next(60)
puts e.next(80)
puts e.next(80)
puts e.next(100)
puts e.next(10)