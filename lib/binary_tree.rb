require 'pry'
require 'byebug'

class BinaryTree

  attr_accessor :value, :right_branch, :left_branch

  def initialize(value)
    @value = value
    @left_branch = nil
    @right_branch = nil
  end

  def insert(value)
    if value > @value
      @right_branch ? @right_branch.insert(value) : @right_branch = BinaryTree.new(value)
    elsif value < @value
      @left_branch ? @left_branch.insert(value) : @left_branch = BinaryTree.new(value)
    else 
      'world ends'
    end
  end
end