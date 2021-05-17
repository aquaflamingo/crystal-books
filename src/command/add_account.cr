module Command
  class AddAccount
    getter ledger : Ledger

    def initialize(@ledger); end

    def run(*args)
			 @ledger.add_account(
					*args
			 )

			 puts "Account added"
    end
  end
end
