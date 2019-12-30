# frozen_string_literal: true

require 'curses'

module Noozoid
  # Gui
  module Gui
  end
end

require_relative 'widgets/help_widget'
require_relative 'widgets/main_widget'
require_relative 'node'

module Noozoid
  # Gui
  module Gui
    # app
    class App
      def initialize
        @tree = Node.new('untitled')
      end

      def run
        Curses.noecho
        Curses.nonl
        Curses.stdscr.keypad(true)
        # Curses.raw
        # Curses.stdscr.nodelay = 1
        Curses.curs_set(0)
        # Curses.start_color
        Curses.init_screen
        Curses.refresh
        @main_window = MainWidget.new(self)
        @main_window.draw
        @main_window.wait
      rescue StandardError
        Curses.close_screen
      end
    end

    def self.start
      app = App.new
      app.run
    end
  end
end
