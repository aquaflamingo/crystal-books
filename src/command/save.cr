require "./base.cr"

module Command
	 class Save < Command::Base
			def run(fname)
				 File.write(fname, ledger.dump_v2)
			end
	 end
end
