class Contact

  attr_reader :first_name, :last_name

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save
    DB.exec("INSERT INTO contacts (first_name, last_name) VALUES ('#{first_name}', '#{last_name}');")
  end

  def full_name
    full_name = @first_name + " " + @last_name
  end

  # def self.find(search_term)
  #   DB.exec("SELECT * FROM contacts WHERE first_name = '#{search_term}' OR last_name = '#{search_term}' OR street1 = '#{search_term}' OR street2 = '#{search_term}' OR city = '#{search_term}' OR state = '#{search_term}' OR zip = '#{search_term}' OR phone = '#{search_term}' OR email = '#{search_term}'").inject([]) {|contact, contact_hash| contact << Contact.new(contact_hash['first_name'], ['last_name'], ['street1'], ['street2'], ['city'], ['state'], [zip], ['phone'], ['email'])}
  # end

  def ==(other)
    self.first_name == other.first_name
  end

  def self.list
    DB.exec("SELECT * FROM contacts;").inject([]) {|contacts, attributes| contacts << Contact.new(attributes)}
  end


end

