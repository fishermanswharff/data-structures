require 'pry'

# what is this Struct? it's a thing that has keys and values
HashEntry = Struct.new(:key, :value)

# creating a new HashTable class
class HashTable
  # get and set the bins
  attr_accessor :bins
  # get and set the bin_count (how many bins are there?)
  attr_accessor :bin_count

  # initialize all the things! 
  # bins is equal to an empty array
  # bin_count is equal to 11 (where does 11 come from?)
  def initialize
    self.bins = []
    self.bin_count = 11
  end

  # assign a bin to a particular key
  def bin_for(key)
    # key.hash —> where does this .hash method come from? 
    # is that a modulo operator? bin_count = 11
    key.hash % self.bin_count
  end

  # the method shovels the value into self? 
  def <<(entry)
    # index refers to the bin that stores the key's values
    index = bin_for(entry.key)
    # if bins[index] doesn't exist create a new array
    self.bins[index] ||= []
    # push entry into the bins[index]
    self.bins[index] << entry
  end

  # creates an array with the key? 
  def [](key)
    # index refers to the bin that holds the key's values
    index = bin_for(key)
    # get HashTable's bin at index, where is .detect coming from? built in? 
    self.bins[index].detect do |entry|
      entry.key == key
    end
  end
end

# create a new HashEntry with a key and value
entry = HashEntry.new :foo, :bar

# create a new table HashTable
table = HashTable.new

# push the entry into the table
table << entry
