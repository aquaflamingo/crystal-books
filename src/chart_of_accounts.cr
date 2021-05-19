require "uuid"

class ChartOfAccounts
	 class NotFound < Exception; end

	 getter accounts = Hash(UUID, Account).new
	 getter account_names = Hash(String, UUID).new

	 def initialize
	 end

	 def add(account : Account)
			account_names[account.name] = account.id
			accounts[account.id] = account
			true
	 end

	 def find(account_id : UUID)
			raise NotFound.new("Could not find id") unless accounts.keys.includes?(account_id)

			return accounts[account_id]
	 end

	 def find(name : String)
			raise NotFound.new("Could not find account with name") unless account_names.keys.includes?(name)

			_id = account_names[name]

			return accounts[_id]
	 end
end
