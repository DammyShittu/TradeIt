class Exchange < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :user
  has_and_belongs_to_many :categories
end
