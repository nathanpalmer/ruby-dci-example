class MoneyTransfer
  include Scenario

  def perform(source_id, destination_id, amount)
    source = Account.find(source_id)
    destination = Account.find(destination_id)
    amount = amount

    cast source.as(Transferrer), destination.as(Transferee) do
      source.transfer_to(destination, amount)
    end

    source
  end

end