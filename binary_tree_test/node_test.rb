require 'minitest/autorun'
require 'minitest/pride'
require '../lib/node.rb'


class NodeTest < Minitest::Test
  def test_node_makes_node
    node_1 = Node.new(60, "Zoolander")

    assert_equal Node, node_1.class
  end
  
  def test_node_has_score
    score = 60
    title = "Zoolander"
    node_1 = Node.new(score, title)

    assert_equal 60, node_1.score
  end

  def test_node_has_title
    node_1 = Node.new(60, "Zoolander")

    assert_equal "Zoolander", node_1.title
  end


  def test_node_left_link_nil_by_default
    node_1 = Node.new(60, "Zoolander")

    assert_nil, = node_1.left_link
  end

  def test_node_right_link_nil_by_default
    node_1 = Node.new(60, "Zoolander")

    assert_nil = node_1.right_link
  end

  def test_node_has_left_link
    node_1 = Node.new(60, "Zoolander",  true)

    assert_equal true, node_1.left_link
  end

  def test_node_has_right_link
    node_1 = Node.new(60, "Zoolander", true, true)

    assert_equal true, node_1.right_link
  end

  def test_node_can_connect_to_another_node
    node_1 = Node.new(60, "Zoolander", true)
    node_2 = Node.new(30, "Cheese")

    node_1.left_link = node_2

    assert_equal node_2, node_1.left_link
  end
end
