require_relative 'person'

class People
  attr_reader :list_of_persons

  def initialize(people_strings, delimiter)
    @list_of_persons = create_people(people_strings, delimiter)
  end

  def add(people_strings, delimiter)
    list_of_persons.push(*create_people(people_strings, delimiter))
  end

  def sort
    list_of_persons.sort_by { |person| person.first_name }
  end

  private

  # city $ birthdate $ last_name $ first_name
  # first_name % city % birthdate
  def create_people(people_strings, delimiter)
    people_strings.split("\n").drop(1).map do |person_string|
      person = person_string.to_s.split(delimiter)

      if delimiter == "$"
        city, birthdate, last_name, first_name = person
      elsif delimiter == "%"
        first_name, city, birthdate = person
      end

      Person.new(first_name, last_name, city, birthdate)
    end
  end
end
