class Category < ApplicationRecord
  has_many :espenses, through: :category_transtactions, dependent: :destroy, class_name: 'Transaction'
  has_many :category_transtactions, dependent: :destroy
  validates :name, presence: true
  validates :icon, presence: true
end
