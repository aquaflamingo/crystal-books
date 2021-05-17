require "./entry.cr"

class Account
	 getter name : String
	 getter balance : Float32
	 getter records : Array(Entry)

	 def initialize(@name, @balance, @records = [] of Entry)
			@_id = UUID.random
	 end

	 def credit(amount : Float32)
			records << Entry.new(
				 Time.utc,
				 amount,
				 Entry::Type::CREDIT
			)
	 end


	 def debit(amount : Float32)
			records << Entry.new(
				 Time.utc,
				 amount,
				 Entry::Type::DEBIT
			)
	 end
end

