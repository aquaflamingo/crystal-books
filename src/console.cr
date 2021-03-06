require "./ledger.cr"
require "./command/*"

class Console
  class InvalidArgument < Exception; end

  getter ledger : Ledger

  def initialize(file_name = "")
		 if file_name.blank?
				print "Loading new session...\n"
			@ledger = Ledger.new("Default")
		 else
				print "Loading #{file_name} into session...\n"
				@ledger = Ledger.load_from(file_name)
		 end
  end

  def start
    # REPL
    loop do
      prompt ">>>"
    end
  end

  protected def handle(input)
    case
    when input.starts_with? "ls"
      Command::List.new(ledger).run
    when input.starts_with? "addaccount"
      args = input.split(" ")
      args.shift

      raise InvalidArgument.new("requires one argument [name]") if args.size != 1

      n = args.last

      raise InvalidArgument.new("name cannot be nil") if n.blank?

      Command::AddAccount.new(ledger).run(n)
    when input.starts_with? "debit"
      args = input.split(" ")
      args.shift

      raise InvalidArgument.new("requires two arguments [name][amount]") if args.size != 2

      n = args.last

      acc_name = args.first
      amount = args.last
      raise InvalidArgument.new("name cannot be nil") if acc_name.blank?
      raise InvalidArgument.new("amount cannot be nil") if amount.blank?

      Command::NewEntry.new(ledger).run(acc_name, amount, :debit)
    when input.starts_with? "credit"
      args = input.split(" ")
      args.shift

      raise InvalidArgument.new("requires two arguments [name][amount]") if args.size != 2

      acc_name = args.first
      amount = args.last
      raise InvalidArgument.new("name cannot be nil") if acc_name.blank?
      raise InvalidArgument.new("amount cannot be nil") if amount.blank?

      Command::NewEntry.new(ledger).run(acc_name, amount, :credit)
    when input.starts_with? "save"
      args = input.split(" ")
      args.shift

      raise InvalidArgument.new("requires two arguments [filename]") if args.size != 1

			fname = args.first
      raise InvalidArgument.new("name cannot be nil") if fname.blank?

			Command::Save.new(ledger).run(fname)
    when input.starts_with? "exit"
      puts "Exiting..."
      exit
    else
      puts "err: #{input} is not a command"
      puts print_commands
    end
  end

  protected def print_commands
		 print <<-EOM
		 ls - list accounts
		 save [name] - save ledger to file
		 debit [account, amount] - debit
		 credit [account, amount] - debit
		 addaccount [name] - add account
		 EOM
  end

  protected def prompt(prompt_symbol : String)
    print prompt_symbol
    input = gets

    begin
      handle(input.chomp) unless input.nil? || input == ""
    rescue ex : Exception
      puts "err: #{ex.message}"
    end
  end
end
