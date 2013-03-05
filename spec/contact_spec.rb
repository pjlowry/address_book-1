require 'spec_helper'

describe Contact do

  context '#initialize' do
    it 'accepts a hash of attributes as its argument' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.should be_an_instance_of Contact
    end
  end

  context 'readers' do
    it 'should return the value for first_name' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.first_name.should eq 'Marcie'
    end

    it 'should return the value of the variable for last_name' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.last_name.should eq 'Morton'
    end

    it 'should return the value of the variable for street1' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.street1.should eq '20640 3rd St'
    end

    it 'should return the value of the variable for street2' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.street2.should eq 'Suite 200'
    end

    it 'should return the value of the variable for city' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.city.should eq 'Saratoga'
    end

    it 'should return the value of the variable for state' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.state.should eq 'CA'
    end

    it 'should return the value of the variable for zip' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.zip.should eq 95070
    end

    it 'should return the value of the variable for phone' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.phone.should eq '408.377.7249'
    end

    it 'should return the value of the variable for email' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.email.should eq 'mmortondc@gmail.com'
    end
  end

  

  context '#save' do
    it 'saves the contact to the database' do
      DB.should_receive(:exec).with("INSERT INTO contacts (first_name, last_name, street1, street2, city, state, zip, phone, email) VALUES ('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', '95070', '408.377.7249', 'mmortondc@gmail.com');")
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => '95070', 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact = Contact.new(attributes)
      contact.save
    end
  end

  context '#full_name' do
    it 'combines the first and last name of the contact into one string' do
      attributes = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
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
      attributes1 = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact1 = Contact.new(attributes1)
      attributes2 = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact2 = Contact.new(attributes2)
      contact1.should eq contact2
    end
  end

  context '.list' do
    it 'lists every contact in the database' do

      attributes1 = {'first_name' => 'Marcie', 'last_name' => 'Morton', 'street1' => '20640 3rd St', 'street2' => 'Suite 200', 'city' => 'Saratoga', 'state' => 'CA', 'zip' => 95070, 'phone' => '408.377.7249', 'email' => 'mmortondc@gmail.com'}
      contact1 = Contact.new(attributes1)
      attributes2 = {'first_name' => 'Dorrit', 'last_name' => 'Geshuri', 'street1' => 'PO Box 611', 'street2' => ' ', 'city' => 'Berkeley', 'state' => 'CA', 'zip' => 94701, 'phone' => '510.495.5432', 'email' => 'dorritgeshuri@gmail.com'}
      contact2 = Contact.new(attributes2)

      contacts = [contact1, contact2]
      contacts.each {|contact| contact.save}
      
      Contact.list.should =~ contacts
    end
  end
end
