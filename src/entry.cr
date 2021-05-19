class Entry
	include YAML::Serializable

  enum Type
    DEBIT
    CREDIT
  end

	@[YAML::Field(key: "id")]
  getter id : UUID
	@[YAML::Field(key: "time")]
  getter time : Time
	@[YAML::Field(key: "amount")]
  getter amount : Float32
	@[YAML::Field(key: "type")]
  getter type : Type

  def initialize(@time : Time, @amount : Float32, @type : Type)
		 @id = UUID.random
  end
end
