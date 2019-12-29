
require_relative '../config'

module Noozoid
  module Gui
    class HelpWidget
      def initialize
        @win = Curses::Window.new(
          Curses.lines / 2, 
          Curses.cols / 2, 
          Curses.lines / 4, 
          Curses.cols / 4
        )
        @win.box(?|, ?-)
        @win.setpos(0, 1)
        @win.addstr(' Noozoid help ')

        self.fill
        @win.refresh
      end

      def fill
        t = 2
        Noozoid::Config::HELP_KEYS.each do |key, desc|
          @win.setpos(t, 7)
          @win.addstr(Noozoid::Config::DEFAULT_KEYS[key])
          @win.setpos(t, 10)
          @win.addstr(desc)
          
          t += 1
        end

        str = 'Press q to close'
        @win.setpos(@win.maxy - 2, @win.maxx - str.size - 2)
        @win.addstr(str)
      end

      def loop
        while true
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
