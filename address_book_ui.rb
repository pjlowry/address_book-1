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
  first_name = gets.chomp
  puts "What is the last name of your new contact?"
  last_name = gets.chomp
  puts "What is the first line of street address of your new contact?"
  street1 = gets.chomp
  puts "What is the second line of street address of your new contact?"
  street2 = gets.chomp
  puts "What is the city of your new contact?"
  city = gets.chomp
  puts "What is the state of your new contact?"
  state = gets.chomp
  puts "What is the zip code of your new contact?"
  zip = gets.chomp
  puts "What is the phone number of your new contact (xxx.xxx.xxxx)?"
  phone = gets.chomp
  puts "What is the email address of your new contact?"
  email = gets.chomp
  contact = Contact.new({'first_name' => first_name, 'last_name' => last_name, 'street1' => street1, 'street2' => street2, 'city' => city, 'state' => state, 'zip' => zip, 'phone' => phone, 'email' => email})
  contact.save
  "'#{first_name} #{last_name}' has been added to your Epic Address Book."
end

welcome