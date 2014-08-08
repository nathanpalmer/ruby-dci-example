require 'active_record'
require_relative 'sidekiq'

# ActiveRecord::Base.logger = Logger.new(STDERR)

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

Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/app/**/*.rb'].each {|file| require file }