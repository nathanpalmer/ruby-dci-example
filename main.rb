require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => ":memory:"
)

ActiveRecord::Schema.define do
  create_table :accounts do |table|
    table.column :name, :string
    table.column :balance, :integer
  end
end

require_relative 'app/models/account'

Account.create!(id: 1)
Account.create!(id: 2)

require_relative 'app/scenarios/money_transfer/scenario'

MoneyTransfer.new(1, 2, 30).execute