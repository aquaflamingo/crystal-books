require "uuid"

class ChartOfAccounts
	 class NotFound < Exception; end

	 getter accounts = Hash(UUID, Account).new
	 getter account_names = Hash(Symbol, UUID).new

	 def initialize
	 end

	 def add(account : Account)
			account_names[account.name.to_sym] = account.id
			accounts[account.id] = account
			true
	 end

	 def find(account_id : UUID)
			raise NotFound.new("Could not find id") unless accounts.includes?(account_id)

			return accounts[account_id]
	 end

	 def find(name : String | Symbol)
			raise NotFound.new("Could not find account with name") unless account_names.includes?(name.to_sym)

			_id = account_names[name.to_sym]

			return accounts[_id]
	 end
end
