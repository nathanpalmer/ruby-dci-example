require_relative 'environment'

# Load test data
source = Account.create!(id: 1, balance: 50)
destination = Account.create!(id: 2, balance: 10)
puts "Source: #{source.balance}, Destination: #{destination.balance}"

# Perform
require 'sidekiq/testing'
Sidekiq::Testing.fake!

MoneyTransfer.perform_async(1, 2, 30)
MoneyTransfer.drain

# Results
source.reload
destination.reload
puts "Source: #{source.balance}, Destination: #{destination.balance}"