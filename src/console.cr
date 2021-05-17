require "./ledger.cr"

class Console
  def run
    # REPL
    loop do
      prompt ">>>"
			puts "hi"
    end
  end

  protected def handle(input)
    case input
    when "ls"
      puts "Would ls accounts"
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

    if input.nil?
      puts "err: command required"
    else
			 handle(input.chomp)
    end
  end
end
