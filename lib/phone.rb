class Phone

  attr_reader :number, :type, :contact_id

  def initialize(options)
    @number = options['number']
    @type = options['type']
    @contact_id = options['contact_id']
  end

  def save
    DB.exec("INSERT INTO phone_numbers (number, type, contact_id) VALUES ('#{number}', '#{type}', #{contact_id});")
  end
end

