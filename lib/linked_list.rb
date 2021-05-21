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

  def prepend(node)
    # add nodes to the beginning of the list
    new_head = Node.new(node)
    new_head.add_next_node(head)
    @head = new_head
    node
  end

  def insert(position, node)
     # will insert one or more elements at a given position in the list.
     # It takes two parameters, the first one is the position at which to insert nodes, the second parameter is the string of data to be inserted.
    node = Node.new(node)
    left_node = node_at_position(@head, position - 1)
    right_node = node_at_position(@head, position)
    left_node.add_next_node(node)
    node.add_next_node(right_node)
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

  def node_at_position(start, position, target_position = 0)
    return start if position == target_position
    node_at_position(start.next_node, position, target_position += 1)
  end
end
