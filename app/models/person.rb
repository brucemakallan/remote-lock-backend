require 'date'

class Person
  attr_accessor :first_name, :city, :birthdate

  def initialize(first_name, last_name, city, birthdate)
    @first_name = first_name&.strip
    @last_name = last_name&.strip
    @city = format_location(city)
    @birthdate = format_date(birthdate)
  end

  private

  def format_date(date)
    datetime = DateTime.parse(date&.strip)
    datetime.strftime("%-m/%-d/%Y") 
  end
  
  # NYC to New York City
  def format_location(location)
    cities[location&.strip&.upcase] || location&.strip
  end

  # TODO: improve with gem if possible
  def cities
    {
      'NYC' => 'New York City',
      'LA' => 'Los Angeles',
      'ATL' => 'Atlanta',
    }
  end
end
