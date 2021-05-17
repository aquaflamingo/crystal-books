require "./ledger.cr"
require "./command/*"

class Console
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
    case input
    when "ls"
			 Command::LS.new(ledger).run
		when "exit"
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

		 handle(input.chomp) unless input.nil? || input == ""
  end
end
