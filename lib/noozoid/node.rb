
module Noozoid
  # Individual node type
  class Node

    protected

    attr_accessor :parent

    public

    attr_accessor :name, :open
    attr_reader :children, :parent

    def initialize(name = 'untitled')
      @name = name
      @children = []
      @parent = nil
      @open = true
    end

    def []=(child)
      @children.push(child)
      child.parent = self
    end

    def [](i)
      @children[i]
    end

    def toggle!
      @open = !@open
    end

    def >>(n = 1)
      return nil if @parent.nil?

      idx = @parent.children.index(self)
      return nil if idx.nil?

      @parent[(idx + n) % @parent.children.length]
    end

    def <<(n = 1)
      self >> -n
    end

    def remove
      @parent.children.delete(self) unless @parent.nil?
    end

    def children?
      !@children.empty?
    end

  end
end
