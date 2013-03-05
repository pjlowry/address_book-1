require 'spec_helper'

describe Contact do

  context 'readers' do
    it 'should return the value of the variable for first_name' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.first_name.should eq 'Marcie'
    end

    it 'should return the value of the variable for last_name' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.last_name.should eq 'Morton'
    end

    it 'should return the value of the variable for street1' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.street1.should eq '20640 3rd St'
    end

    it 'should return the value of the variable for street2' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.street2.should eq 'Suite 200'
    end

    it 'should return the value of the variable for city' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.city.should eq 'Saratoga'
    end

    it 'should return the value of the variable for state' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.state.should eq 'CA'
    end

    it 'should return the value of the variable for zip' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.zip.should eq 95070
    end

    it 'should return the value of the variable for phone' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.phone.should eq '408.377.7249'
    end

    it 'should return the value of the variable for email' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.email.should eq 'mmortondc@gmail.com'
    end
  end

  context '#initialize' do
    it 'should accept first_name, last_name, street1, street2, city, state, zip, phone and email as arguments' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.should be_an_instance_of Contact
    end
  end

  context '#save' do
    it 'saves the contact to the database' do
      DB.should_receive(:exec).with("INSERT INTO contacts (first_name, last_name, street1, street2, city, state, zip, phone, email) VALUES ('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')")
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.save
    end
  end

  context '#full_name' do
    it 'combines the first and last name of the contact into one string' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.full_name.should eq 'Marcie Morton'
    end
  end

  context '.find' do
    it 'queries the database and returns a contact object when a match is found' do
      contact = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact.save
      first_name = 'Marcie'
      found_contact = Contact.find(first_name)
      found_contact.should eq contact
    end
  end

  context '#==' do
    it 'considers two contacts equal if they contain the same data' do
      contact1 = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact2 = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact1.should eq contact2
    end
  end

  context '.list' do
    it 'lists every contact in the database' do
      contact1 = Contact.new('Marcie', 'Morton', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact2 = Contact.new('Dorrit', 'Geshuri', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contact3 = Contact.new('Mike', 'Ignaffo', '20640 3rd St', 'Suite 200', 'Saratoga', 'CA', 95070, '408.377.7249', 'mmortondc@gmail.com')
      contacts = [contact1, contact2, contact3]
      contacts.each {|contact| contact.save}
      
      # contacts = Contact.list #['Marcie Morton', 'Dorrit Geshuri']
      # contacts.map {|contact| contact.full_name}.should =~ contacts

      Contact.list.should =~ contacts
    end
  end
end
