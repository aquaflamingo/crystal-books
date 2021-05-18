require "./ledger.cr"
require "./command/*"

class Console
	 class InvalidArgument < Exception; end  
  getter ledger : Ledger

  def initialize(@name = "Default")
    @ledger = Ledger.new(@name)
  end

  def run
    # REPL
    loop do
      prompt ">>>"
    end
  end

  protected def handle(input)
    case
    when input.starts_with? "ls"
      Command::LS.new(ledger).run
    when input.starts_with? "addaccount"
			 args = input.split(" ")
			 args.shift

			raise InvalidArgument.new("missing arguments [name]") if args.size != 1

			puts "args #{args}"
			n = args.last

			raise InvalidArgument.new("name cannot be nil") if n.blank?

      Command::AddAccount.new(ledger).run(n)
		when input.starts_with? "save"

		when input.starts_with? "exit"
      puts "Exiting..."
      exit
    else
      puts "err: #{input} is not a command"
      puts print_commands
    end
  end

  protected def print_commands
    # ls - list accounts
    # info - print ledger
    # save [name] - save ledger to file
    # load [file] - load ledger from file
    # debit [account, amount] - debit
    # credit [account, amount] - debit
    # add_account [name] - add account
    # show [name] - show account transaction history
  end

  protected def prompt(prompt_symbol : String)
    print prompt_symbol
    input = gets

		begin 
    handle(input.chomp) unless input.nil? || input == ""
		rescue ex : InvalidArgument
			 puts "err: #{ex.message}"
		end
  end
end
