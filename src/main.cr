require "option_parser"
require "./crystal_books.cr"

opts = Hash(Symbol, String).new
OptionParser.parse do |parser|
  parser.banner = "Welcome to CrystalBooks"

  parser.on "-f", "--file", "Load ledger from yml" do |f|
		 opts[:file] = f
  end

  parser.on "-v", "--version", "Show version" do
		 puts "#{CrystalBooks::VERSION}"
    exit
  end

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
end

CrystalBooks::App.start

