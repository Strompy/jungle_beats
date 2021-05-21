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

    assert_equal nil, list.head
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
end



# > list.head
# => nil
# > list.append("doop")
# => "doop"
# > list
# => <LinkedList head=<Node data="doop" next_node=nil #5678904567890> #45678904567>
# > list.head.next_node
# => nil
# > list.count
# => 1
# > list.to_string
# => "doop"
