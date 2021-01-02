
require "ncurses"

module Noozoid
  class Tui
    def initialize
      #@tree = Noozoid::Models::Node.new('untitled')
    end

    def run
      # initialize
      NCurses.init
      NCurses.cbreak
      NCurses.noecho
      NCurses.keypad(true)
      NCurses.start_color

      # define background color
      pair = NCurses::ColorPair.new(1).init(NCurses::Color::RED, NCurses::Color::BLACK)
      NCurses.bkgd(pair)
      NCurses.curs_set(0)

      NCurses.erase

      # move the cursor & write
      NCurses.move(x:0, y: 1)
      NCurses.addstr(NCurses.longname)


      NCurses.move(x:0, y: 2)
      NCurses.addstr(NCurses.curses_version)


      # attach models to views
      #@main_window = MainView.new(self)
      #@main_window.draw
      #@main_window.wait

      NCurses.notimeout(true)

      x = NCurses.maxx / 2
      y = NCurses.maxy / 2

      loop do
        NCurses.erase
        NCurses.move(x: x, y: y)
        NCurses.addstr("o")
        NCurses.refresh

        key = NCurses.getch

        case key
        when 'q', NCurses::KeyCode::ESC
          break

        when NCurses::KeyCode::LEFT
          x -= 1
          x = 0 if x < 0

        when NCurses::KeyCode::RIGHT
          x += 1
          x = NCurses.maxx - 1 if x >= NCurses.maxx

        when NCurses::KeyCode::UP
          y -= 1
          y = 0 if y < 0

        when NCurses::KeyCode::DOWN
          y += 1
          y = NCurses.maxy - 2 if y >= NCurses.maxy - 1
         
        end
      end

      NCurses.endwin

      #rescue StandardError => e
      #Curses.close_screen
      #warn e.message unless e.nil?
      #warn e.backtrace unless e.nil?
    end
  end

  def self.start
    app = App.new
    app.run
  end
end
