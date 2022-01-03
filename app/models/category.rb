class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :exchanges

  def total_amount
    exchanges.sum(:amount)
  end
end
