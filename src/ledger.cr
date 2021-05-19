require "yaml"
require "./account.cr"
require "./chart_of_accounts.cr"

class Ledger
  getter name : String
  getter chart : ChartOfAccounts

  def initialize(@name, @chart = ChartOfAccounts.new); end

  def add_account(name : String, initial_balance : Float32)
    account = Account.new(
      name.to_s,
      initial_balance
    )

    chart.add(account)

    return account
  end

  def debit(account_id : UUID | String, amount : Float32, time = Time.utc)
    _id = UUID.new(account_id)

    account = chart.find(_id)

    account.debit(time, amount)

    true
  end

  def debit(account_name : String, amount : Float32, time = Time.utc)
    account = chart.find(account_name)

    account.debit(time, amount)

    true
  end

  def credit(account_id : UUID | String, amount : Float32, time = Time.utc)
    _id = UUID.new(account_id)

    account = chart.find(_id)

    account.credit(time, amount)

    true
  end

  def credit(account_name : String, amount : Float32, time = Time.utc)
    account = chart.find(account_name)

    account.credit(time, amount)

    true
  end

	def self.load_from(file : String)
	 yaml = File.open(file) do |file|
		 YAML.parse(file)
	 end

	 # TODO load accounts 
	end

  def dump
    String.build do |str|
      @chart.accounts.each do |id, acc|
        res = YAML.build do |y|
          y.mapping do
            y.scalar id
            y.mapping do
              y.scalar "account_name"
              y.scalar acc.name.downcase
              y.scalar "transactions"
              y.sequence do
                acc.records.each do |record|
                  y.mapping do
                    y.scalar record.id
                    y.mapping do
                      y.scalar "date"
                      y.scalar record.time.to_s
                      y.scalar "type"
                      y.scalar record.type
                      y.scalar "amount"
                      y.scalar record.amount
                    end
                  end
                end
              end
            end
          end
        end
        str << res
      end
    end unless @chart.accounts.empty?
  end
end
