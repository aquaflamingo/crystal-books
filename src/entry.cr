class Entry
  enum Type
    DEBIT
    CREDIT
  end

  getter id : UUID
  getter time : Time
  getter amount : Float32
  getter type : Type

  def initialize(@time : Time, @amount : Float32, @type : Type)
		 @id = UUID.random
  end
end
