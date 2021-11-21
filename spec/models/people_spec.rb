require 'spec_helper'

RSpec.describe 'People Test' do
  describe 'People Model' do
    let(:params) do
      {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        order: :first_name,
      }
    end
    let(:people) { People.new(params[:percent_format], "%") }

    it 'sorts input' do
      expect(people.sort.first.first_name).to eq 'Elliot'
    end
  end
end
