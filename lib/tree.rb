require_relative 'node.rb'

  class Tree

    attr_accessor :depth, :head

    def initialize
      @values = []
      @keys = []
      @head = nil
      @depth = 0
      @number_of_nodes = 0
    end
    #insert module
    def insert(score, title)
      #tests if there is no head create one
      if @head == nil
        @number_of_nodes += 1
        @head = Node.new(score, title)
      else
        #checks if head has left or right node, if not makes node
        if score < @head.score && @head.left_link == nil
          @number_of_nodes += 1
          next_node = Node.new(score, title)
          #adds 1 to depth if tree doesn't already have opposite node
          if @head.right_link == nil
            @depth += 1
            next_node.depth = @depth
          end
          @head.left_link = next_node

        elsif score > @head.score && @head.right_link == nil
          @number_of_nodes += 1
          next_node = Node.new(score, title)
          if @head.left_link == nil
            @depth += 1
            next_node.depth = @depth
          end
          @head.right_link = next_node
          #this is where the recursion happens. Reassigns head to search
          #tree for nil node
        else
          if score < @head.score
            @head = @head.left_link
            insert(score, title)
          elsif score > @head.score
            @head = @head.right_link
            insert(score, title)
          end
        end
      end
    end
    #tests whether or not a particular score exists in tree
    #returns true or false accordingly
    def include?(score)
      if score == @head.score
        true
      else
        #searches tree for node with inputted score
        if score < @head.score && @head.left_link != nil
          @head = @head.left_link
          include?(score)
        elsif score > @head.score && @head.left_link !=nil
          @head = @head.right_link
          include?(score)
        else
          false
        end
      end
    end
    #searches tree for depth of node with a particular score
    def depth_of(score)
      if @head.score == score
        #depth at head is nil, this conditional assigns a zero
        #value to the head
        if @head.depth == nil
          0
        else
          @head.depth
        end
      else
        #searches tree for node with inputted score
        if score < @head.score && @head.left_link != nil
          @head = @head.left_link
          depth_of(score)
        elsif score > @head.score && @head.right_link != nil
          @head = @head.right_link
          depth_of(score)
        end
      end
    end
    #searches tree for node with max score
    def max
      #sees if current head is furthest right node and assigns
      #the values of title and score to a hash
      if @head.right_link == nil
        max_hash = Hash.new
        max_hash[@head.title] = @head.score
        max_hash
      else
        #Searches tree for furthest right node
        @head = @head.right_link
        max
      end
    end
    #searches tree for node with lowest score and returns Hash
    #with that nodes title and score
    def min
      if @head.left_link == nil
        min_hash = Hash.new
        min_hash[@head.title] = @head.score
        min_hash
      else
        @head = @head.left_link
        min
      end
    end

    #takes all nodes and places them in a hash with
    #ascending score values
    # def sort
    #   sorted_movies = Hash.new
    #   # until sorted_movies.keys.count == @number_of_nodes
    #     if @head.left_link == nil
    #       sorted_movies[@head.title] = @head.score
    # #     elsif sorted_movies.values.include?(@head.left_link.score)
    # #       @head = @head.right_link
            # sort
    #     else
    #       @head = @head.left_link
    #       sort
    #     end
    #   # end
    #   sorted_movies
    # end

    #takes in a text file and inputs data into an Array
    #then a hash, removing all repeated values, returning
    #total number of inputted pairs
    def load(text_file)
      file = File.read("#{text_file}")
      movie_list = []
      file.each_line {|line|
          movie_list << (line.chomp.split(", "))}

      compare_movie_list = Hash.new
      movie_list.each do |score_title_pair|
        compare_movie_list[score_title_pair[1]] = score_title_pair[0]
      end

      number_of_movies_loaded = compare_movie_list.values.count
    end

    #tests the health of the tree by looking at a particular depth
    #and returning arrays with the scores of every node at that
    #depth, the total number of nodes in the tree, and a percentage
    #of nodes below that particular point
    def health(depth)
      health_meters = Array.new
      if 0 == depth
        health_meters.push(@head.score,
                            @number_of_nodes,
                          ((@number_of_nodes/@number_of_nodes) * 100))
      end
    end
  end
