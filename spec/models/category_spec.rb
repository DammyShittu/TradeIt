require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category Model Validations' do
    subject { Category.new(name: 'Gadgets', user_id: 1) }

    before { subject.save }

    it 'checks if name is not valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'validates recent exchanges method' do
    before do
      4.times do |post|
        Exchange.create(author_id: subject, name: "Exchange #{post}", amount: 50)
      end
    end

    it 'shows recent exchanges' do
      expect(subject.recent_exchanges).to eq(subject.exchanges)
    end
  end

  describe 'checks associations' do
    it 'belongs to a user' do
      expect(Category.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'has and belongs to many exchanges' do
      expect(Category.reflect_on_association(:exchanges).macro).to eq(:has_and_belongs_to_many)
    end
  end
end
