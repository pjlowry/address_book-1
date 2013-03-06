require 'pg'
require './lib/contact'
require './lib/phone'

DB = PG.connect(:dbname => 'address_book_test', :host => 'localhost')

def welcome
  puts "Welcome to the Fucking Address Book!"
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
      add_new_contact
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

def add_new_contact
  puts "What is the first name of your new contact?"
  first_name = gets.chomp
  puts "What is the last name of your new contact?"
  last_name = gets.chomp
  contact = Contact.new({'first_name' => first_name, 'last_name' => last_name})
  contact.save
  "'#{first_name} #{last_name}' has been added to your Fucking Address Book."
  puts "What other information would you like to add? (p for phone, a for address, e for email, f for finished)"
  choice = gets.chomp
    case choice
      when 'p'
        add_phone
      when 'a'
        add_address
      when 'e'
        add_email
      when 'f'
        finish
      else
        invalid
    end
end

def add_phone
  puts "Enter the phone number in this format: xxx.xxx.xxxx"
  phone = gets.chomp
  puts "What type of phone is this?  (cell, home or work?)"
  type = gets.chomp
  phone.save
  puts "Okay! '#{first_name} #{last_name}' now has a #{type} phone of #{phone}"
end

welcome