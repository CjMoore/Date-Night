require 'minitest/autorun'
require 'minitest/pride'
require '../lib/tree.rb'
require '../lib/node.rb'
require 'pry'

class TreeTest < Minitest::Test

  def test_tree_makes_tree
    tree = Tree.new

    assert_equal Tree, tree.class
  end

  def test_insert_makes_node
    tree = Tree.new
    node = tree.insert(95, "Star Wars")

    assert_equal Node, node.class
  end

  def test_does_insert_takes_right_arguements
    score = 95
    title = "Star Wars"
    tree = Tree.new
    node_1 = tree.insert(score, title)

    assert_equal Node, node_1.class
    assert_equal 95, node_1.score
    assert_equal "Star Wars", node_1.title
  end

  def test_if_tree_makes_head
    tree = Tree.new
    head = tree.insert(95, "Star Wars")

    assert_equal head, tree.head
    assert_equal Node, head.class
  end

  def test_can_add_new_node
    tree = Tree.new
    head = tree.insert(95, "Starwars")
    node_1 = tree.insert(60, "Zoolander")

    assert_equal node_1, tree.head.left_link
    assert_equal Node, node_1.class
  end

  def test_node_goes_left
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_1 = tree.insert(60, "Zoolander")

    assert_equal node_1, tree.head.left_link
  end

  def test_node_goes_right
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_2 = tree.insert(100, "The Warriors")

    assert_equal node_2, head.right_link
  end

  def test_head_has_depth_of_zero
    tree = Tree.new
    head = tree.insert(95, "Star Wars")

    assert_equal 0, tree.depth
  end

  def test_next_node_has_depth_of_one
  tree = Tree.new
  head = tree.insert(95, "Star Wars")
  current_node = tree.insert(100, "The Warriors")

  assert_equal 1, tree.depth
  end

  def test_tree_searches_iteslf_for_nil
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_2 = tree.insert(60, "Zoolander")
    node_3 = tree.insert(40, "Ever After")

    assert_equal node_2.left_link, tree.head.left_link
    assert_equal node_3, node_2.left_link
  end

  def test_two_nodes_down_have_depth_of_two
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_2 = tree.insert(60, "Zoolander")
    node_3 = tree.insert(40, "Ever After")

    assert_equal 2, tree.depth
  end

  def test_if_tree_can_get_really_deep_bro
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    ode_2 = tree.insert(60, "Zoolander")
    node_3 = tree.insert(40, "Ever After")
    node_other_side = tree.insert(100, "The Warriors")
    node_4 = tree.insert(35, "DND The Movie")
    node_5 = tree.insert(30, "Bad Movie")
    node_6 = tree.insert(25, "Another Bad Movie")
    node_7 = tree.insert(20, "Really Bad Movie")
    node_8 = tree.insert(1, "Willow")

    assert_equal 7, tree.depth
  end

  def test_include_is_false_when_given_unincluded_score
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_2 = tree.insert(60, "Zoolander")
    node_3 = tree.insert(40, "Ever After")
    node_4 = tree.insert(100, "The Warriors")

    refute tree.include?(30)
  end

  def test_include_can_return_true_given_head_score
    tree = Tree.new
    head = tree.insert(95, "Star Wars")

    assert tree.include?(95)
  end

  def test_include_can_search_left_for_score
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_2 = tree.insert(60, "Zoolander")
    node_3 = tree.insert(40, "Ever After")

    assert tree.include?(40)
  end

  def test_include_can_search_right_for_score
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_2 = tree.insert(60, "Zoolander")
    node_3 = tree.insert(40, "Ever After")
    node_4 = tree.insert(100, "The Warriors")

    assert tree.include?(100)
  end

  def test_depth_of_can_return_depth_of_head
    tree = Tree.new
    head = tree.insert(95, "Star Wars")

    assert_equal 0, tree.depth_of(95)
  end

  def test_depth_can_return_depth_of_one_deep
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_2 = tree.insert(60, "Zoolander")

    assert_equal 1, tree.depth_of(60)
  end

  def test_depth_can_return_really_deep
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_2 = tree.insert(60, "Zoolander")
    node_3 = tree.insert(40, "Ever After")
    node_4 = tree.insert(35, "DND The Movie")
    node_5 = tree.insert(100, "The Warriors")
    node_6 = tree.insert(25, "Another Bad Movie")
    node_7 = tree.insert(20, "Really Bad Movie")
    node_8 = tree.insert(98, "Demolition Man")


    assert_equal 5, tree.depth_of(20)
  end

  def test_max_returns_head_if_head_has_max_score
    tree = Tree.new
    head = tree.insert(100, "The Warriors")
    node_2 = tree.insert(40, "Ever After")

    max_hash = Hash.new
    max_hash[head.title] = head.score

    assert_equal max_hash, tree.max
  end

  def test_max_searches_tree_for_max_score
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_2 = tree.insert(60, "Zoolander")
    node_3 = tree.insert(40, "Ever After")
    node_4 = tree.insert(100, "The Warriors")

    max_hash = Hash.new
    max_hash[node_4.title] = node_4.score

    assert_equal max_hash, tree.max
  end

  def test_max_one_more_time_with_different_arrangement
    tree = Tree.new
    head = tree.insert(60, "Zoolander")
    node_2 = tree.insert(40, "Ever After")
    node_3 = tree.insert(100, "The Warriors")
    node_4 = tree.insert(95, "Star Wars")

    max_hash = Hash.new
    max_hash[node_3.title] = node_3.score

    assert_equal max_hash, tree.max
  end

  def test_min_returns_head_if_head_has_lowest_score
    tree = Tree.new
    head = tree.insert(40, "Ever After")
    node_2 = tree.insert(95, "Star Wars")

    min_hash = Hash.new
    min_hash[head.title] = head.score

    assert_equal min_hash, tree.min
  end

  def test_min_searches_tree_for_lowest_score
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_2 = tree.insert(60, "Zoolander")
    node_3 = tree.insert(40, "Ever After")
    node_4 = tree.insert(100, "The Warriors")

    min_hash = Hash.new
    min_hash[node_3.title] = node_3.score

    assert_equal min_hash, tree.min
  end

  def test_min_one_more_time_with_different_arrangement
    tree = Tree.new
    head = tree.insert(60, "Zoolander")
    node_2 = tree.insert(40, "Ever After")
    node_3 = tree.insert(100, "The Warriors")
    node_4 = tree.insert(30, "Bad Movie")

    min_hash = Hash.new
    min_hash[node_4.title] = node_4.score

    assert_equal min_hash, tree.min
  end

  # def test_sort_has_correct_number_of_nodes
  #   tree = Tree.new
  #   head = tree.insert(60, "Zoolander")
  #   node_2 = tree.insert(40, "Ever After")
  #   node_3 = tree.insert(100, "The Warriors")
  #   node_4 = tree.insert(30, "Bad Movie")
  #
  #   assert_equal 4, tree.sort
  # end

  # def test_sort_can_sort_head_node_if_head_has_lowest_score
  #   tree = Tree.new
  #   head = tree.insert(40, "Ever After")
  #   node_2 = tree.insert(100, "The Warriors")
  #
  #   sorted_movies = Hash.new
  #   sorted_movies[head.title] = head.score
  #
  #   assert_equal sorted_movies, tree.sort
  # end
  # #
  # def test_sort_moved_down_left_nodes
  #   tree = Tree.new
  #   head = tree.insert(95, "Star Wars")
  #   node_2 = tree.insert(60, "Zoolander")
  #   node_3 = tree.insert(40, "Ever After")
  #   binding.pry
  #
  #   sorted_movies = Hash.new
  #   sorted_movies = {"Ever After"=>40, "Zoolander"=>60,
  #                       "Star Wars"=>95}
  #
  #   assert_equal sorted_movies, tree.sort
  # end

  def test_load_loads_file
    tree = Tree.new
    file = tree.load("text.txt")
    refute_equal nil, file
  end

  def test_load_returns_number_of_movies_inputted_ignoring_repeats
    tree = Tree.new
    number_of_movies_loaded = tree.load("text.txt")

    assert_equal 99, number_of_movies_loaded
  end

  def test_health_at_head
    tree = Tree.new
    head = tree.insert(95, "Star Wars")
    node_3 = tree.insert(40, "Ever After")
    node_4 = tree.insert(100, "The Warriors")

    assert_equal [95, 3, 100], tree.health(0)
  end
end
