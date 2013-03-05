require 'pg'
require './lib/contact'

DB = PG.connect(:dbname => 'address_book_test', :host => 'localhost')

def welcome
  puts "Welcome to the Epic Address Book!"
  menu
end

def menu
  choice = nil
  until choice == 'q'
    puts "Press the following keys to make changes to your contacts: 'a' to add, 'l' to list, 
          'e' to edit, or 'd' to delete."
    puts "Press 'q' to quit."
    choice = gets.chomp
    case choice
    when 'a'
      add
    when 'l'
      list
    when 'e'
      edit
    when 'd'
      delete
    when 'q'
      quit
    else
      invalid
    end
  end
end

def add
  puts "What is the first name of your new contact?"
  first = gets.chomp
  puts "What is the last name of your new contact?"
  last = gets.chomp
  contact = Contact.new(first_name, last_name)
  contact.save
  "'#{first_name} #{last_name}' has been added to your Epic Address Book."
end

welcome