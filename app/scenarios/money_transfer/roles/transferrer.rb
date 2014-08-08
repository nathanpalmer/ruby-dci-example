module Transferrer
  extend ActiveSupport::Concern

  def transfer_to(destination, amount)
    puts "Transferring #{amount} to #{destination}"
    self.decrement!(:balance, amount)
    destination.increment!(:balance, amount)
    self
  end
end