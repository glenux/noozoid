# frozen_string_literal: true

require 'observer'

module Noozoid
  # Individual node type
  module Models
    # Proper output of a tree
    # module PrettyPrint
    #   def self.tree(subtree, current, indent = 0)
    #     print ' ' * indent
    #     print subtree == current ? '> ' : '- '
    #     print subtree.name + "\n"
    #     return unless subtree.open
    #     subtree.children.each do |child|
    #       tree(child, current, indent + 2)
    #     end
    #   end
    # end

    # Mindmap node
    class Node
      include Observable

      attr_accessor :name, :content, :open
      attr_reader :children, :parent

      def initialize(name = 'untitled')
        @name = name
        @content = nil
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
end
