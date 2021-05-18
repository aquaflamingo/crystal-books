require "./entry.cr"

class Account
	 getter id : UUID
	 getter name : String
	 getter records : Array(Entry)

	 def initialize(@name, initial_balance : Float32, @records = [] of Entry)
			@id = UUID.random

			# Initial entry
			records << Entry.new(
				 Time.utc,
				 initial_balance,
				 Entry::Type::DEBIT
			)
	 end

	 def balance
			records.sum do |entry|
				 amount = entry.amount 
				 amount *= -1 if entry.type == Entry::Type::CREDIT
				 amount
			end
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

