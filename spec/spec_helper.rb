require 'pg'
require 'rspec'
require 'contact'
require 'phone'

RSpec.configure do |config|
  config.after(:all) do
    DB.exec("DELETE FROM contacts *;")
  end
end


DB = PG.connect(:dbname => 'address_book_test', :host => 'localhost')