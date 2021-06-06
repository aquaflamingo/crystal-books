require "yaml"
require "./account.cr"
require "./chart_of_accounts.cr"

class Ledger
  include YAML::Serializable

  @[YAML::Field(key: "name")]
  getter name : String
  @[YAML::Field(key: "chart_of_accounts")]
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

  def debit(account_id : String, amount : Float32, time = Time.utc)
    _id = account_id

    account = chart.find(_id)

    account.debit(time, amount)

    true
  end

  def debit(account_name : String, amount : Float32, time = Time.utc)
    account = chart.find(account_name)

    account.debit(time, amount)

    true
  end

  def credit(account_id : String, amount : Float32, time = Time.utc)
    _id = account_id

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
    File.open(file) do |file|
			 from_yaml(file)
    end
  end

  def dump
    self.to_yaml
  end
end
