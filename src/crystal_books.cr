require "./ledger.cr"

module CrystalBooks
	 VERSION = "0.0.1"

	 class App
			def self.run(name : String)
				 Ledger.new(name)
			end
	 end
end
