require "./account.cr"
require "./chart_of_accounts.cr"

class Ledger
	 getter name : String
	 getter chart : ChartOfAccounts

	 def initialize(@name, @chart = ChartOfAccounts.new); end

	 def add_account(name : String, initial_balance : Float32)
			account = Account.new(
				 name.to_s, 
				 initial_balance
			)

			chart.add(account)

			return account
	 end

	 def debit(account_id : UUID | String, time : Time, amount : Float32)
			_id = UUID.new(account_id)

			account = chart.find(_id)

			account.debit(time, amount)

			true
	 end

	 def debit(account_name : String, time : Time, amount : Float32)
			account = chart.find(account_name)

			account.debit(time, amount)

			true
	 end

	 def credit(account_id : UUID | String, time : Time, amount : Float32)
			_id = UUID.new(account_id)

			account = chart.find(_id)

			account.debit(time, amount)

			true
	 end

	 def credit(account_name : String, time : Time, amount : Float32)
			account = chart.find(account_name)

			account.debit(time, amount)

			true
	 end
end
