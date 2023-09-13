class Category < ApplicationRecord
  has_many :category_transactions, dependent: :destroy
  has_many :expenses, through: :category_transactions, dependent: :destroy, class_name: 'Transaction'
  validates :name, presence: true
  validates :icon, presence: true
end
