require "option_parser"
require "./crystal_books.cr"

OptionParser.parse do |parser|
  parser.banner = "Welcome to CrystalBooks"

  parser.on "-v", "--version", "Show version" do
		 puts "#{CrystalBooks::VERSION}"
    exit
  end

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end

	parser.on "start", "Start CrystalBooks" do
		 CrystalBooks::App.start
	end
end

CrystalBooks::App.start

