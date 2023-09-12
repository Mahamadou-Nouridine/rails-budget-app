class CategoryTransaction < ApplicationRecord
  belongs_to :expense, class_name: 'Transaction'
  belongs_to :category
end
