class Gadget
  attr_accessor :username, :password
  attr_reader :production_number, :apps

  def initialize(username:, password:)
    reset(username, password)
    @production_number = generate_production_number
  end

  def to_s
    "Gadget #{production_number} has the username #{username}. It is made from the #{self.class} class and it has the id #{object_id}"
  end

  def password=(new_password)
    @password = new_password if validate_password(new_password)
  end

  def reset(username, password)
    # calling an instance methods (for setters you need to append `self.` at the beginning)
    self.username = username
    self.password = password
    self.apps = []
  end

  private

  attr_writer :apps

  def generate_production_number
    "#{("a".."z").to_a.sample}-#{rand(1..999)}"
  end

  def validate_password(password)
    password.is_a?(String) && password.length >= 6 && password =~ /\d/
  end
end
