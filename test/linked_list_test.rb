require 'minitest/autorun'
require 'minitest/pride'
require "./lib/linked_list"

class LinkedListTest < Minitest::Test
  def test_it_exists
    node = Node.new('plop')
    list = LinkedList.new
    assert_instance_of LinkedList, list
  end

  def test_it_has_attributes
    list = LinkedList.new

    assert_nil list.head
  end

  def test_it_can_append
    list = LinkedList.new
    list.append('doop')
    node = list.head

    assert_equal 'doop', node.data
    assert_nil node.next_node
    assert_nil list.head.next_node
    assert_equal 1, list.count
    assert_equal 'doop', list.to_string
  end

  def test_it_can_append_multiple
    list = LinkedList.new
    list.append('doop')
    node = list.head

    assert_equal 'doop', node.data
    assert_nil node.next_node
    assert_nil list.head.next_node
    assert_equal 1, list.count
    assert_equal 'doop', list.to_string

    list.append('deep')
    node_2 = list.head.next_node
    assert_instance_of Node, node_2
    assert_equal 2, list.count
    assert_equal 'doop deep', list.to_string
  end

  def test_it_can_prepend
    list = LinkedList.new
    list.append('plop')
    node = list.head

    assert_equal 'plop', node.data
    assert_equal 'plop', list.to_string

    list.append("suu")
    list.prepend("dop")
    assert_equal "dop plop suu", list.to_string
    assert_equal 3, list.count
  end

  def test_it_can_insert
    list = LinkedList.new
    list.append('plop')
    list.append("suu")
    list.prepend("dop")

    list.insert(1, "woo")

    assert_equal "dop woo plop suu", list.to_string
  end
end
