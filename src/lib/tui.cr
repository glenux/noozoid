
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
      pair = NCurses::ColorPair.new(1).init(NCurses::Color::WHITE, NCurses::Color::BLACK)
      NCurses.bkgd(pair)
      NCurses.curs_set(0)

      NCurses.erase

      # move the cursor & write
      NCurses.move(x:0, y: 1)
      NCurses.addstr(NCurses.longname)


      NCurses.move(x:0, y: 2)
      NCurses.addstr(NCurses.curses_version)

      NCurses.notimeout(true)

      x = NCurses.maxx / 2
      y = NCurses.maxy / 2

      # NCurses.box(v: '|', h: '=')

      routes = {
        'q'.ord => -> do
          NCurses.endwin  
          exit 0 
          return nil
        end,

        NCurses::KeyCode::ESC => -> do
          NCurses.endwin 
          exit 0 
          return nil
        end,

        NCurses::KeyCode::LEFT => -> do
          x -= 1
          x = 0 if x < 0
        end,

        NCurses::KeyCode::RIGHT => -> do
          x += 1
          x = NCurses.maxx - 1 if x >= NCurses.maxx
        end,

        NCurses::KeyCode::UP => -> do
          y -= 1
          y = 0 if y < 0
        end,

        NCurses::KeyCode::DOWN => -> do
          y += 1
          y = NCurses.maxy - 2 if y >= NCurses.maxy - 1
        end
      }

      loop do
        NCurses.erase
        NCurses.move(x: x, y: y)
        NCurses.addstr("o")
        NCurses.refresh

        key = NCurses.getch
        routes[key].call if routes.keys.includes? key
        # ctx = { a: 1 }
      end
    end
  end

  def self.start
    app = App.new
    app.run
  end
end
