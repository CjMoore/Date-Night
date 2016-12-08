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

    def insert(score, title)

      if @head == nil
        @head = Node.new(score, title)
      else

        if score < @head.score && @head.left_link == nil
          next_node = Node.new(score, title)
          if @head.right_link == nil
            @depth += 1
            next_node.depth = @depth
          end
          @head.left_link = next_node

        elsif score > @head.score && @head.right_link == nil
          next_node = Node.new(score, title)
          if @head.left_link == nil
            @depth += 1
            next_node.depth = @depth
          end
          @head.right_link = next_node

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

    def include?(score)
      if score == @head.score
        true
      else
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

    def depth_of(score)
      if @head.score == score
        if @head.depth == nil
          0
        else
          @head.depth
        end
      else
        if score < @head.score && @head.left_link != nil
          @head = @head.left_link
          depth_of(score)
        elsif score > @head.score && @head.right_link != nil
          @head = @head.right_link
          depth_of(score)
        end

      end

    end


    def max
      if @head.right_link == nil
        max_hash = Hash.new
        max_hash[@head.title] = @head.score
        max_hash
      else
        @head = @head.right_link
        max
      end
    end

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

    def sort



    end

    def load(text_file)
      file = File.read("#{text_file}")
      movie_list = []
      file.each_line {|line|
          movie_list << line}

      number_of_movies_loaded = movie_list.count
    end

  end
