class Node

  attr_reader :title, :score
  attr_accessor :left_link, :right_link, :depth

  def initialize(score, title)
    @title      = title
    @score      = score
    @left_link  = nil
    @right_link = nil
    @depth      = depth
  end

end
