require 'spec_helper'
require 'byebug'
require 'pry'

require_relative '../lib/binary_tree'

describe BinaryTreeNode do

  let(:bt) { -> (value) { bt = BinaryTreeNode.new(value) } }
  let(:tree) { bt.call(50) }

  before :each do
    tree.insert(40)
    tree.insert(60)
    tree.insert(49)
    tree.insert(48)
    tree.insert(51)
    tree.insert(39)
  end

  describe '.new' do
    it 'creates a new Binary Tree' do
      expect(tree.value).to eq 50
    end
  end

  describe '#insert' do
    it 'inserts a new node' do
      expect(tree.left_branch.value).to eq 40
      expect(tree.left_branch.right_branch.value).to eq 49
      expect(tree.right_branch.value).to eq 60
      expect(tree.left_branch.right_branch.left_branch.value).to eq 48
      expect(tree.left_branch.left_branch.value).to eq 39
    end
  end

  describe '#destroy' do
    it 'destroys the node' do
      expect(tree.destroy(50)).to eq true
    end
  end

  describe '#find' do
    it 'returns the matching node' do
      expect(tree.find(49).left_branch.value).to eq 40
    end

    it 'returns self if the value equals the root value' do
      expect(tree.find(50).value).to eq 50
    end
  end
end
