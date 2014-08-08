class MoneyTransfer

  def initialize(source_id, destination_id, amount)
    @source = Account.find(source_id)
    @destination = Account.find(destination_id)
    @amount = amount
  end

  def execute
    @source.as(Transferrer) do
      @source.transfer_to(@destination, @amount)
    end
    @source
  end

end