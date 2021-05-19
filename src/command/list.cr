require "./base.cr"
module Command
  class List < Command::Base
    def run
      result = String.build do |s|
        s << "| Id | Account | Balance |"
        s << "\n"
        s << "| --- | --- | --- |"
        s << "\n"

        @ledger.chart.accounts.each do |id, acc|
          s << "| #{id} | #{acc.name} | #{acc.balance} |"
          s << "\n"
        end
      end

      print result

			print ledger.dump_v2
    end
  end
end
