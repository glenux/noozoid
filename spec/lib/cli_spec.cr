
require "../spec_helper"

describe Noozoid::Cli do
  describe "#start" do
    it "cshould respond to this method on class" do
      {{ Noozoid::Cli.class.has_method?("start") }}.should be_true
    end
  end
end

