require_relative 'environment'

# Load test data
source = Account.create!(id: 1, balance: 50)
destination = Account.create!(id: 2, balance: 10)
puts "Source: #{source.balance}, Destination: #{destination.balance}"

# Perform
MoneyTransfer.new(1, 2, 30).execute

# Results
source.reload
destination.reload
puts "Source: #{source.balance}, Destination: #{destination.balance}"