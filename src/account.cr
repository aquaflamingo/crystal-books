require "./entry.cr"

class Account
	 getter id : UUID
	 getter name : String
	 getter balance : Float32
	 getter records : Array(Entry)

	 def initialize(@name, @balance, @records = [] of Entry)
			@id = UUID.random
	 end

	 def credit(time : Time, amount : Float32)
			records << Entry.new(
				 time,
				 amount,
				 Entry::Type::CREDIT
			)
	 end


	 def debit(time : Time, amount : Float32)
			records << Entry.new(
				 time,
				 amount,
				 Entry::Type::DEBIT
			)
	 end
end

