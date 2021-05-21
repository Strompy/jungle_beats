require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(node)
    # adds a new piece of data (data can really be anything) to the list
    @head = Node.new(node)
    node
  end

  def count
    # tells us how many things are in the list
    if @head.nil?
      0
    else
      1
    end
  end

  def to_string
    #  generates a string of all the elements in the list, separated by spaces
    head.data
  end
end
