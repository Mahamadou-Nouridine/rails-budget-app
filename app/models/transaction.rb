class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_one :category, through: :category_transactions
  has_one :category_transaction
end
