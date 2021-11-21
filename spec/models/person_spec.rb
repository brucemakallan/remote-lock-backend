require 'spec_helper'

RSpec.describe 'Person Test' do
  describe 'Person model' do
    let(:person) { Person.new('Jane', 'Doe', 'ATL', '1990-01-21') }

    it 'fomats date correctly' do
      expect(person.birthdate).to eq '1/21/1990'
    end

    it 'fomats city correctly' do
      expect(person.city).to eq 'Atlanta'
    end
  end
end
