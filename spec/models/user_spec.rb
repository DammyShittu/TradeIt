require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Model Validations' do
    subject { User.new(name: 'Damola', email: 'admin20@admin.com', password: 'ght546e') }

    before { subject.save }

    it 'checks if name is valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'checks if email is present' do
      subject.email = 'admin20@admin.com'
      expect(subject).to be_valid
    end

    it 'checks if email is not present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'checks associations' do
    it 'has many categories' do
      expect(User.reflect_on_association(:categories).macro).to eq(:has_many)
    end

    it 'has many exchanges' do
      expect(User.reflect_on_association(:exchanges).macro).to eq(:has_many)
    end
  end
end
