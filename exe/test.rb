#!/usr/bin/env ruby

require 'curses'
include Curses

file = File.open ARGV[0]

begin
  init_screen
  file.each {|line| addstr(line) }
  refresh
  getch
ensure
  close_screen
end
