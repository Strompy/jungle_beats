require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(node)
    # adds a new piece of data (data can really be anything) to the list
    if head
      head.add_next_node(Node.new(node))
    else
      @head = Node.new(node)
    end
    # require "pry"; binding.pry
    node
  end

  def count
    # tells us how many things are in the list
    count = 0
    current = head
    until current.nil?
      current = current.next_node
      count += 1
    end
    count
  end

  def to_string
    #  generates a string of all the elements in the list, separated by spaces
    data = []
    current = head
    until current.nil?
      data << current.data
      current = current.next_node
    end
    data.join(' ')
  end
end
