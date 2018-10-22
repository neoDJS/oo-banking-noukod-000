class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  def initialize(name="")
    @name = name
    @balance = 1000
    @status = "open"
  end

  def name=(name="")
    raise AccessError, "You can't change the name of the Bank Account"
  end

  def deposit(money=0)
  end

  def display_balance
    @balance
  end

  def valid?
    @status == "open" && @balance > 0
  end

end
