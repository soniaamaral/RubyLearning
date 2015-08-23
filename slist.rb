class Element
  attr_accessor :value, :next_
  def initialize(value, next_)
    @value = value
    @next_ = next_
  end
  def count
    return 1 if @next_.nil?
    1 + @next_.count
  end
  def to_s
    return "#{@value}" if @next_.nil?
    "#{@value} #{@next_}"
  end
end

class Slist
  def count
    return 0 if @head.nil?
    @head.count
  end
  def push(new_element)
    @head = Element.new(new_element, @head)
  end
  def first
    @head.value
  end
  def pop
    @head = @head.next_
  end
  def to_s
    "()" if @head.nil?
    "(#{@head})"
  end
end



list = Slist.new
p list.count

list.push "dog"
p list.first
list.push "cat"
list.push "squirrel"
p list.to_s
p list.first
p list.count
list.pop
p list.first
