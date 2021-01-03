
require "spec"
require "../src/lib/tui"

describe Noozoid::Tui do
  describe "#run" do
    it "cshould respond to this method on class" do
      {{ Noozoid::Tui.has_method?("run") }}.should be_true
    end
  end
end
