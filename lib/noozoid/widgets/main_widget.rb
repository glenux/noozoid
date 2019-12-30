# frozen_string_literal: true

require_relative '../version'

module Noozoid
  module Gui
    # Main widget (full screen)
    class MainWidget
      HEADER_HELP_STR = "noozoid #{Noozoid::VERSION} " \
        '~ Use the arrow keys to navigate, press ? for help'

      def initialize(parent)
        @parent = parent
        @win = Curses::Window.new(Curses.lines, Curses.cols, 0, 0)
        # @win.box('|', '-')
        @win.refresh
        @title = 'untitled'
      end

      def title=(value)
        @title = value
        draw_header_title
        @win.refresh
      end

      def draw_header_help
        @win.attron(Curses::A_REVERSE)
        @win.setpos(0, 0)
        @win.addstr(' ' * Curses.cols)
        @win.setpos(0, 0)
        @win.addstr(HEADER_HELP_STR)
        @win.attroff(Curses::A_REVERSE)
      end

      def draw_header_title
        @win.setpos(1, 0)
        @win.addstr('-' * Curses.cols)
        @win.setpos(1, 4)
        @win.addstr(" #{@title} ")
      end

      def draw
        draw_header_help
        draw_header_title
        @win.refresh
      end

      def wait
        loop do
          key = Curses.getch
          case key
          when Curses::Key::LEFT
            @win.setpos(10, 1)
            @win.addstr('LEFT')
          when Curses::Key::PPAGE
            Curses.setpos(10, 1)
            Curses.addstr('Page Up')
          when Curses::Key::NPAGE
            Curses.setpos(10, 1)
            Curses.addstr('Page Dn')
          when '?'
            subwin = HelpWidget.new(self)
            subwin.wait
          when 'q'
            break
          else
            @win.setpos(10, 10)
            @win.addstr("#{key}    ")
          end
          @win.refresh
        end
      end
    end
  end
end
