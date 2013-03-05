class Contact

  attr_reader :first_name, :last_name, :street1, :street2, :city, :state, :zip, :phone, :email

  def initialize(first_name, last_name, street1, street2, city, state, zip, phone, email)
    @first_name = first_name
    @last_name = last_name
    @street1 = street1
    @street2 = street2
    @city = city
    @state = state
    @zip = zip
    @phone = phone
    @email = email

  end

  def save
    DB.exec("INSERT INTO contacts (first_name, last_name, street1, street2, city, state, zip, phone, email) VALUES ('#{@first_name}', '#{@last_name}', '#{@street1}', '#{@street2}', '#{@city}', '#{@state}', #{@zip}, '#{@phone}', '#{@email}')")
  end

  def full_name
    full_name = @first_name + " " + @last_name
  end

  def self.find(first_name)
    DB.exec("SELECT * FROM contacts WHERE first_name = '#{first_name}'").inject([]) {|contact, contact_hash| contact << Contact.new(contact_hash['first_name'], ['last_name'], ['street1'], ['street2'], ['city'], ['state'], ['zip'], ['phone'], ['email'])}.first
  end

  def ==(other)
    self.first_name == other.first_name
  end

  # def list
  #   puts "Here is a list of your contacts:"
  #   contacts = 
  #   contacts.each {|contact| puts contact.first_name}
  # end


end