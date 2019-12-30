# frozen_string_literal: true

require 'curses'
require_relative '../config'

module Noozoid
  module Gui
    # HelpWidget
    class HelpWidget
      TITLE_STRING = 'Noozoid help'
      QUIT_STRING = 'Press q to close'

      def initialize(parent)
        @parent = parent
        @win = Curses::Window.new(
          Curses.lines / 2, Curses.cols / 2,
          Curses.lines / 4, Curses.cols / 4
        )
        @win.box('|', '-')
        @win.setpos(0, @win.maxx / 4)
        @win.attron(Curses::A_REVERSE)
        @win.addstr(TITLE_STRING.center(@win.maxx / 2))
        @win.attroff(Curses::A_REVERSE)
        fill_content
        @win.refresh
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
          break if key == 'q'
        end
        @win.clear
        @win.refresh
        @win.close
      end
    end
  end
end
