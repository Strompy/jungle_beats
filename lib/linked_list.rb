require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(node)
    # adds a new piece of data to the list
    if head.nil?
      @head = Node.new(node)
    else
      tail(head).add_next_node(Node.new(node))
    end
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

  def pop
    # removes elements the last element from the list.
    og_tail = tail
    new_tail = node_at_position(head, count - 2)
    new_tail.remove_next_node
    og_tail.data
  end

  def find(start_position, number)
    # two parameters, the first indicates the first position to return
    # the second parameter specifies how many elements to return.
    first_node = node_at_position(head, start_position)
    data = []
    current = first_node
    number.times do
      data << current.data
      current = current.next_node
    end
    data.join(' ')
  end

  def includes?(data, starting_position = head)
    #  gives back true or false whether the supplied value is in the list.
    return true if starting_position.data == data
    return false if starting_position.next_node.nil?
    includes?(data, starting_position.next_node)
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

  private

  def tail(starting_position = head)
    return starting_position if starting_position.next_node.nil?
    tail(starting_position.next_node)
  end

  def node_at_position(starting_node, target_position, position = 0)
    return starting_node if target_position == position
    node_at_position(starting_node.next_node, target_position, position += 1)
  end
end
