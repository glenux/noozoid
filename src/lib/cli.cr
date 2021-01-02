
require "clim"

require "./tui"

module Noozoid
  class Cli < Clim
    main do
      desc "Happy Send - Mass send short text messages via your smartphone + kdeconnect"

      usage "happy-send [options] [arguments] ..."

      option "-v", "--verbose", 
        type: Bool,
        default: false,
        desc: "Enable debug messages"

      option "-c FILE", "--csv=FILE", 
        type: String,
        required: false,
        desc: "Use given CSV (mandatory fields: number,message)"

      run do |opts, args|
        Log.setup(:warn)
        Log.setup(:debug) if opts.verbose

        app = Noozoid::Tui.new
        app.run
        # app = HappyApp.new(csv: opts.csv, send: opts.send, wait: opts.wait)
      end
    end
  end
end

