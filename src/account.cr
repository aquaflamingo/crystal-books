require "./entry.cr"

class Account
	 include YAML::Serializable

	 @[YAML::Field(key: "account_id")]
	 getter id : String
	 @[YAML::Field(key: "account_name")]
	 getter name : String
	 @[YAML::Field(key: "records")]
	 getter records : Array(Entry)

	 def initialize(@name, initial_balance : Float32, @records = [] of Entry)
			@id = UUID.random.to_s

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

