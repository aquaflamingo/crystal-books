require "./console.cr"

module CrystalBooks
  VERSION = "0.0.1"

  class App
    def self.start(file)
			 Console.new(file).start
    end
  end
end
