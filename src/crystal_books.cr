require "./console.cr"

module CrystalBooks
  VERSION = "0.0.1"

  class App
    def self.start
			 Console.new.run
    end
  end
end
