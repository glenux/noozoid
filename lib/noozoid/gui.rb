
require 'curses'

module Noozoid
  module Gui
  end
end

require_relative 'widgets/help_widget'
require_relative 'widgets/main_widget'

module Noozoid
  module Gui
    def start
      Curses.init_screen
      # invisible cursor
      Curses.curs_set(0) 
      Curses.refresh
      @main_window = MainWindow.new
      while true do
        @main_window.refresh
        @main_window.loop
      end
    rescue Exception => e
      Curses.close_screen
      puts e
    end

=begin
      win2 = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols / 2 - 1, 
                                Curses.lines / 2, Curses.cols / 2)
      win2.box("|", "-")
      win2.refresh
      2.upto(win2.maxx - 3) do |i|
        win2.setpos(win2.maxy / 2, i)
        win2 << "*"
        win2.refresh
        sleep 0.05 
      end

      # Clearing windows each in turn
      sleep 0.5 
      win1.clear
      win1.refresh
      win1.close
      sleep 0.5
      win2.clear
      win2.refresh
      win2.close
      sleep 0.5
=end

    module_function :start
  end
end
