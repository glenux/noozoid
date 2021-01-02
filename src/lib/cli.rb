
module Noozoid
  class Cli < Thor

    desc 'gui', 'Start ncurses GUI'
    def gui
      Gui.start
    end

    default_task :gui
  end
end

