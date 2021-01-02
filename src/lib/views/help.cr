# frozen_string_literal: true

require 'curses'
require_relative '../config'
require_relative '../utils/auto_ajust'

module Noozoid
  module Gui
    # HelpView
    class HelpView
      TITLE_STRING = 'Noozoid help'
      QUIT_STRING = 'Press q to close'

      def initialize(parent)
        @parent = parent
        @display = false
      end

      def show
        lines_size = Utils::AutoAdjust.set(Curses.lines / 2, 10, 20)
        lines_top = (Curses.lines - lines_size) / 2
        cols_size = Utils::AutoAdjust.set(Curses.cols / 2, 20, 60)
        cols_left = (Curses.cols - cols_size) / 2

        @win = Curses::Window.new(lines_size, cols_size, lines_top, cols_left)
        @win.box('|', '-')
        @win.setpos(0, @win.maxx / 4)
        @win.attron(Curses::A_REVERSE)
        @win.addstr(TITLE_STRING.center(@win.maxx / 2))
        @win.attroff(Curses::A_REVERSE)
        fill_content
        @win.refresh
        @display = true
      end

      def hide
        @win.clear
        @win.refresh
        @win.close
        @display = false
      end

      def fill_content
        t = 2
        Noozoid::Config::HELP_KEYS.each do |key, desc|
          @win.setpos(t, 2)
          @win.addstr(Noozoid::Config::DEFAULT_KEYS[key].rjust(7))
          @win.setpos(t, 11)
          @win.addstr(desc)
          t += 1
        end

        @win.setpos(@win.maxy - 2, @win.maxx - QUIT_STRING.size - 2)
        @win.addstr(QUIT_STRING)
      end

      def wait
        loop do
          key = Curses.getch
          @win.refresh if key == Curses::Key::RESIZE
          break if key == 'q'
        end
      end
    end
  end
end
