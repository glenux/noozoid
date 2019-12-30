# frozen_string_literal: true

module Noozoid
  # Individual node type
  class Node
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

    def [](index)
      @children[index]
    end

    def toggle!
      @open = !@open
    end

    def >>(num = 1)
      return nil if @parent.nil?

      idx = @parent.children.index(self)
      return nil if idx.nil?

      @parent[(idx + num) % @parent.children.length]
    end

    def <<(num = 1)
      self >> -num
    end

    def remove
      @parent&.children&.delete(self)
    end

    def children?
      !@children.empty?
    end
  end
end
