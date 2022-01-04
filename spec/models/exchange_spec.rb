require 'rails_helper'

RSpec.describe Exchange, type: :model do
  describe 'Exchange Model Validations' do
    subject { Exchange.new(name: 'Smartphone', amount: 30, author_id: 1) }

    before { subject.save }

    it 'checks if name is not valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'validates that amount is an integer' do
      subject.amount = '@m,,'
      expect(subject).to_not be_valid
    end

    it 'validates that amount is greater than or equal to 0' do
      subject.amount = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'checks associations' do
    it 'has and belongs to many exchanges' do
      expect(Exchange.reflect_on_association(:categories).macro).to eq(:has_and_belongs_to_many)
    end

    it 'belongs to a user' do
      expect(Exchange.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end
end
