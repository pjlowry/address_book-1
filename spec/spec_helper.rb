require 'pg'
require 'rspec'
require 'contact'

DB = PG.connect(:dbname => 'address_book_test', :host => 'localhost')

RSpec.configure do |config|
  config.after(:all) do
    DB.exec("DELETE FROM contacts *;")
  end
end
