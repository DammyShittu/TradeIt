class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :exchanges

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    exchanges.sum(:amount)
  end

  def recent_exchanges
    exchanges.order(created_at: :desc)
  end
end
