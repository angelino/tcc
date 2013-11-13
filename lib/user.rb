class User
  attr_reader :id, :location, :age

  def initialize(attributes)
    @id = attributes[:userid]
    @location = attributes[:location]
    @age = attributes[:age]
  end
end
