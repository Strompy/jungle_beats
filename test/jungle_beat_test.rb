require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test
  def test_it_exists
    jb = JungleBeat.new

    assert_instance_of JungleBeat, jb
    assert_instance_of LinkedList, jb.list
    assert_nil jb.list.head
  end

  def test_it_can_append_multiple_beats
    jb = JungleBeat.new
    assert_equal "deep doo ditt", jb.append("deep doo ditt")
    assert_equal 'deep', jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data
    assert_equal "woo hoo shu", jb.append("woo hoo shu")
    assert_equal 6, jb.count
  end

  def test_it_can_make_sick_beats
    jb = JungleBeat.new
    assert_equal 'deep doo ditt woo hoo shu', jb.append('deep doo ditt woo hoo shu')
    assert_equal 6, jb.count
    assert_equal 6, jb.list.count
    jb.play
  end
end
