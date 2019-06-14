require_relative "PolyTreeNode"
attr_reader :root_node

class KnightPathFinder

  def valid_moves(pos)
    a = [[-1,-2], [2,1], [-1,2], [-2,1], [1,-2], [2,-1], [-1,-2], [-2,-1]]

    poss_moves = a.map { |poss_move| [poss_move[0] + pos[0], poss_move[1] + pos[1]] }
    val_moves = []
    poss_moves.each do |valid_move|
      valid_cordinates = (0..7).to_a
      if valid_cordinates.include?(valid_move[0]) && valid_cordinates.include?(valid_move[1])
        val_moves << valid_move
      end
    end
    val_moves
  end


  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_position = [pos]
    #build_move_tree
  end

  def build_move_tree

  end

  def new_move_positions(pos)
    #@considered_position += KnightPathFinder.valid_moves(pos) - @considered_position
    @considered_position += KnightPathFinder.valid_moves(pos).select { |move| !@considered_position.include?(move) }
  end
end

# move_tree(root = pos)
