require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Nouridine', email: 'nouridine@gmail.com', password: 'abcdef') }
  let(:category) { Category.new(name: 'Macdo', icon: 'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60', user_id: user.id) }
  it 'the category should be valid' do
    expect(category).to be_valid
  end
  it 'Without the name, the category is not valid' do
    category.name = ''
    expect(category).not_to be_valid
  end
  it 'Without the user, the category is not valid' do
    category.user_id = nil
    expect(category).not_to be_valid
  end
end
