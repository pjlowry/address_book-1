require 'spec_helper'

describe Contact do

  context '#initialize' do
    it 'accepts a hash of attributes as its argument' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton'}
      contact = Contact.new(attributes)
      contact.should be_an_instance_of Contact
    end
  end

  context 'readers' do
    it 'should return the value for first_name' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton'}
      contact = Contact.new(attributes)
      contact.first_name.should eq 'Marcie'
    end

    it 'should return the value of the variable for last_name' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton'}
      contact = Contact.new(attributes)
      contact.last_name.should eq 'Morton'
    end
  end

  context '#save' do
    it 'saves the contact to the database' do
      DB.should_receive(:exec).with("INSERT INTO contacts (first_name, last_name) VALUES ('Marcie', 'Morton');")
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton'}
      contact = Contact.new(attributes)
      contact.save
    end
  end

  context '#full_name' do
    it 'combines the first and last name of the contact into one string' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton'}
      contact = Contact.new(attributes)
      contact.full_name.should eq 'Marcie Morton'
    end
  end

  # context '.find' do
  #   it 'queries the database and returns a contact object when a match is found' do
  #     contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
  #     contact.save
  #     search_term = 'Marcie'
  #     found_contact = Contact.find(search_term)
  #     found_contact.should eq contact
  #   end
  # end

  context '#==' do
    it 'considers two contacts equal if they contain the same data' do
      attributes1 = {'first_name' => 'Marcie', 'last_name' => 'Morton'}
      contact1 = Contact.new(attributes1)
      attributes2 = {'first_name' => 'Marcie', 'last_name' => 'Morton'}
      contact2 = Contact.new(attributes2)
      contact1.should eq contact2
    end
  end

  context '.list' do
    it 'lists every contact in the database' do

      attributes1 = {'first_name' => 'Marcie', 'last_name' => 'Morton'}
      contact1 = Contact.new(attributes1)
      attributes2 = {'first_name' => 'Dorrit', 'last_name' => 'Geshuri'}
      contact2 = Contact.new(attributes2)

      contacts = [contact1, contact2]
      contacts.each {|contact| contact.save}
      
      Contact.list.should =~ contacts
    end
  end
end
