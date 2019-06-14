require "byebug"

class PolyTreeNode #represents a node in a tree. Can have an arbitrary number of children
 
  def initialize(value) # method that sets the value, and starts parent as nil, and children to an empty array.
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent #method that returns the node's parent.
    @parent 
  end

  def children #method that returns an array of children of a node.
    @children
  end

  def value #method that returns the value stored at the node.
    @value
  end

  def parent=(parent_node)
    if !self.parent.nil?
      self.parent.children.delete(self)
      @parent = nil
    end
    @parent = parent_node

    if !parent_node.nil? 
      parent_node.children << self if !parent_node.children.include?(self)
    end
  end

  def add_child(child_node)
    self.children << child_node
    child_node.parent=self
  end

  def remove_child(child_node)
    raise "error, children is not there" if self.children.delete(child_node).nil?
    child_node.parent=nil
  end

  def dfs(target_value)
    if self.value == target_value
      return self
    else
      self.children.each do |child_node| 
        result = child_node.dfs(target_value)
        return result unless result.nil?
      end
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    
    until queue.empty?
      current_node = queue.shift
      if current_node.value == target_value
        return current_node
      else
        queue += current_node.children
      end
    end
    nil
  end
end