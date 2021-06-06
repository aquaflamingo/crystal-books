require "./base.cr"

module Command
	 class Save < Command::Base
			def run(fname)
				 print "Saving to #{fname}\n"
				 File.write(fname, ledger.dump)
				 print "Done..."
			end
	 end
end
