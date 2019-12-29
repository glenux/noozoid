require_relative '../version'

module Noozoid::Gui
  class MainWindow
    def initialize
      @win = Curses::Window.new(Curses.lines, Curses.cols, 0, 0)
      # @win.box(?|, ?-)
      # @win.refresh
      @title = 'untitled'
    end

    def title=(value)
      @title = value
      self.refresh
    end

    def draw_header
      top_str = "noozoid #{Noozoid::VERSION} ~ Use the arrow keys to navigate, press ? for help"
      @win.attron(Curses::A_REVERSE)
      @win.setpos(0, 0)
      @win.addstr(" " * Curses.cols)
      @win.setpos(0, 0)
      @win.addstr(top_str)
      @win.attroff(Curses::A_REVERSE)
      @win.setpos(1, 0)
      @win.addstr('-' * Curses.cols)
      @win.setpos(1, 4)
      @win.addstr(" #{@title} ")
    end

    def refresh
      self.draw_header
      @win.refresh
    end

    def loop
      key = Curses.getch
      @win.setpos(10, 1)
      @win.addstr(" #{key.to_s} ")
      case key
      when ??
        subwin = HelpWidget.new
        subwin.loop
      when ?q 
        raise "Exit"
      end
    end
  end
end
