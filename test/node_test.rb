require 'minitest/autorun'
require 'minitest/pride'
require "./lib/node"

class NodeTest < Minitest::Test
  def test_it_exists
    node = Node.new('plop')
    assert_instance_of Node, node
  end
  def test_it_has_attributes
    node = Node.new('plop')

    assert_equal 'plop', node.data
    assert_equal nil, node.next_node
  end
end



#node = Node.new("plop")
#node.data
# "plop"
#node.next_node
# nil
