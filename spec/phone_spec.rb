require 'spec_helper'

describe Phone do

  context '#initialize' do
    it 'accepts a hash of attributes as its argument' do
      attributes = {'number' => '510.777.7777', 'type' => 'cell', 'contact_id' => '1'}
      phone = Phone.new(attributes)
      phone.should be_an_instance_of Phone
    end
  end

  context 'readers' do
    it 'should return the value for number' do
      attributes = {'number' => '408.377.7249', 'type' => 'cell'}
      phone = Phone.new(attributes)
      phone.number.should eq '408.377.7249'
    end

    it 'should return the value for type' do
      attributes = {'number' => '408.377.7249', 'type' => 'cell'}
      phone = Phone.new(attributes)
      phone.type.should eq 'cell'
    end

    it 'should return the value for contact_id' do
      attributes = {'number' => '408.377.7249', 'type' => 'cell', 'contact_id' => 1}
      phone = Phone.new(attributes)
      phone.contact_id.should eq 1
    end
  end

  context '#save' do
    it 'saves the phone info to the database' do
      DB.should_receive(:exec).with("INSERT INTO phone_numbers (number, type) VALUES ('408.335.3255', 'cell');")
      attributes = {'number' => '408.335.3255', 'type' => 'cell'}
      phone = Phone.new(attributes)
      phone.save
    end
  end
end