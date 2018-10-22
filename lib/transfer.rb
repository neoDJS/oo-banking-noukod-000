class TypeMismatchError < TypeError; end
class Transfer
  # your code here
  def initialize(from, to, amount)
    raise TypeMismatchError, "Sender object class #{from.class} received, BankAccount expected" if !from.is_a?(BankAccount)
    @sender = from
    @receiver = to
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if (@status == pending)
      
    end
  end
end
