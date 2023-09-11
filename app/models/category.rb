class Category < ApplicationRecord
  has_many :transactions, through: :category_transtactions, dependent: :destroy
  has_many :category_transtactions, dependent: :destroy,
end
