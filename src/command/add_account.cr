module Command
  class AddAccount
    getter ledger : Ledger

    def initialize(@ledger); end

		def run(name : String)
			 @ledger.add_account(
					name, 0.0
			 )

			 puts "Account added"
    end
  end
end
