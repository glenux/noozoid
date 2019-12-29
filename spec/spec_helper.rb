$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "namarara"

require "minitest/autorun"
require 'pathname'

def testfile(name)
  Pathname.new(__FILE__).dirname.join('files', name)
end
