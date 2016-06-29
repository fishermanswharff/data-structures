class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
    @prev_node = nil
  end
end

class DoubleLinkedList
  attr_accessor :head, :tail

  def initialize(values = nil)
    @head = nil
    @tail = nil
    if values
      populate(values)
    end
  end

  def append(value)
    node = Node.new(value)
    if empty?
      @head = node
    else
      node.prev_node = @tail
      @tail.next_node = node
    end
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    if empty?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head.prev_node = node
      @head = node
    end
  end

  def length
    count = 0
    node = @head
    while node do
      count += 1
      node = node.next_node
    end
    count
  end

  def find(value)
    node = @head
    while node do
      return node if node.value == value
      node = node.next_node
    end
  end

  private
  def empty?
    length <= 0
  end

  def populate(values)
    # for each value in values create a new node with that value
    values.each { |value| append(value) }
  end
end