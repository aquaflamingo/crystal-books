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
    "ls"
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
