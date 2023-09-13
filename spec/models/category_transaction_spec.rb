require 'rails_helper'

RSpec.describe CategoryTransaction, type: :model do
  let (:user) {User.create(name: 'Nouridine', email: 'nouridine@gmail.com', password: 'abcdef')}
  let(:transaction) { Transaction.new(name: 'Macdo', author: user, amount: 20) }
  let(:category) { Category.new(name: 'Macdo', icon: 'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60', user_id: user.id) }
  let (:category_transaction) {CategoryTransaction.new(category: category, expense: transaction)}

  it 'the category transaction should be valid' do
    expect(category_transaction).to be_valid
  end
  it 'Without the category, the category transaction is not valid' do
    category_transaction.category = nil
    expect(category_transaction).not_to be_valid
  end
  it 'Without the expense, the category transaction is not valid' do
    category_transaction.expense = nil
    expect(category_transaction).not_to be_valid
  end
end
