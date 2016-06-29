require 'pry'
require 'byebug'

class BinaryTreeNode

  attr_accessor :value
  attr_reader :right_branch, :left_branch, :root

  def initialize(value)
    @value = value
    @left_branch = nil
    @right_branch = nil
  end

  def insert(value)
    if value > @value
      @right_branch ? @right_branch.insert(value) : @right_branch = BinaryTreeNode.new(value)
    elsif value < @value
      @left_branch ? @left_branch.insert(value) : @left_branch = BinaryTreeNode.new(value)
    else
      'world ends'
    end
  end

  def find(value_to_find, node = self)
    if node.nil? || node.value == value_to_find
      return node
    elsif value_to_find < node.value
      find(value_to_find, node.left_branch)
    else value_to_find > node.value
      find(value_to_find, node.right_branch)
    end
  end

  def destroy(value)
  end
end
