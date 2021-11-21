require_relative 'models/person'
require_relative 'models/people'

class PeopleController
  # params hash
  # {
  #   dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
  #   percent_format: File.read('spec/fixtures/people_by_percent.txt'),
  #   order: :first_name,
  # }
  def initialize(params)
    @params = params
  end

  # returns sorted array. e.g
  # [
  #   'Elliot, New York City, 5/4/1947',
  #   'Mckayla, Atlanta, 5/29/1986',
  # ]
  def normalize
    people = People.new(params[:dollar_format], "$")
    people.add(params[:percent_format], "%")

    people.sort.map { |person| "#{person.first_name}, #{person.city}, #{person.birthdate}" }
  end

  private

  attr_reader :params
end
