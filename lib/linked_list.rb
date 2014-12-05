require 'byebug'
require 'pry'

class Node 
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList

  attr_accessor :head, :tail

  def initialize(first_value = nil)
    node = first_value ? Node.new(first_value) : nil
    @head = node
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head
    @head = node
  end

  def append(value)
    node = Node.new(value)
    @tail.next_node = node
    node.next_node = nil
    @tail = node
  end

  def find(value)
    node = @head
    while node do
      return node if node.value == value
      node = node.next_node
    end
  end

  def insert_after(node, value)
    newNode = Node.new(value)
    newNode.next_node = node.next_node
    node.next_node = newNode
  end

  def reverse
    self
  end

  def shift
    node = @head
    @head = @head.next_node
    temp = node
    node = nil
    temp
  end

  # we start with head
  # we know we've reached the head, because the head never has a next_node
  # head should be a node that doens't have a next_node
  def length
    count = 0
    node = @head
    while node do
      count += 1
      node = node.next_node
    end
    count
  end
end











