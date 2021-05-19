require "./base.cr"

module Command
  class AddAccount < Command::Base

		def run(name : String)
			 @ledger.add_account(
					name, 0.0
			 )

			 puts "Account added"
    end
  end
end
