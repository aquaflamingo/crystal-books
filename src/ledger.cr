require "./account.cr"

class Ledger
	 getter name : String
	 getter accounts : Array(Account)

	 def initialize(@name, @accounts); end
end
