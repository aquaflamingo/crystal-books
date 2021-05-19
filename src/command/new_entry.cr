module Command
  class NewEntry
    getter ledger : Ledger

    def initialize(@ledger); end

    def run(acc_name : String, amount : String, type : Symbol)
      amount_f = amount.to_f32

      case type
      when :credit
        ledger.credit(acc_name, amount_f)
      when :debit
        ledger.debit(acc_name, amount_f)
      else
        raise ArgumentError.new("#{type} is not a valid type")
      end
    end
  end
end
