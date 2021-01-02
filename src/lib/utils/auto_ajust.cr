module Noozoid
  module Utils
    module AutoAdjust
      def self.set(ideal, min, max)
        target = ideal
        target = min if target < min
        target = max if target > max
        target
      end
    end
  end
end
