class LRUCache
  attr_reader :capacity, :cur_size, :head, :tail
=begin
      :type capacity: Integer
=end
  def initialize(capacity)
    @capacity = capacity
    @cur_size = 0
    @hash = {}
    @head = nil
    @tail = nil
  end
  
  
=begin
    :type key: Integer
    :rtype: Integer
=end
  def get(key)
    return -1 unless @hash.key?(key)

    element = @hash[key]
    move_to_tail(element)
    element.value
  end
  
  
=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
  def put(key, value)
    if @hash.key?(key)
        element = @hash[key]
        element.value = value
        move_to_tail(element)
    else
        new_element = Element.new(key, value)
        @hash[key] = new_element
        attach_element(new_element)

        if @hash.size > @capacity
          evict_least_recently_used
        end
    end
  end

  def move_to_tail(element)
    return if element == @tail

    remove_element(element)
    attach_element(element)
  end

  def attach_element(element)
    if @tail
      @tail.next = element
      element.prev = @tail
    else
      @head = element
    end
    @tail = element
  end

  def remove_element(element)
    @head = element.next if element == @head
    @tail = element.prev if element == @tail

    element.prev.next = element.next if element.prev
    element.next.prev = element.prev if element.next

    element.prev = nil
    element.next = nil
  end

  def evict_least_recently_used
    return unless @head

    @hash.delete(@head.key)
    remove_element(@head)
  end

  class Element
    attr_accessor :key, :value, :prev, :next

    def initialize(key, value)
      @key = key
      @value = value
      @prev = nil
      @next = nil
    end
  end

end
  