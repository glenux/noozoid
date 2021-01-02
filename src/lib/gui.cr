# frozen_string_literal: true

module Noozoid
  # Gui
  module Gui
    # app
    class App
      def initialize
        @tree = Noozoid::Models::Node.new('untitled')
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

        # attach models to views
        @main_window = MainView.new(self)
        @main_window.draw
        @main_window.wait

      rescue StandardError => e
        Curses.close_screen
        warn e.message unless e.nil?
        warn e.backtrace unless e.nil?
      end
    end

    def self.start
      app = App.new
      app.run
    end
  end
end
