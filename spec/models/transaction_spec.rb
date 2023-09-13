require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let (:user) {User.create(name: 'Nouridine', email: 'nouridine@gmail.com', password: 'abcdef')}
  let(:transaction) { Transaction.new(name: 'Macdo', author: user, amount: 20) }

  it 'the transaction should be valid' do
    expect(transaction).to be_valid
  end
  it 'Without the name, the transaction is not valid' do
    transaction.name = ''
    expect(transaction).not_to be_valid
  end
  it 'Without the author, the transaction is not valid' do
    transaction.author = nil
    expect(transaction).not_to be_valid
  end
  it 'Without the amount, the transaction is not valid' do
    transaction.amount = nil
    expect(transaction).not_to be_valid
  end
end
