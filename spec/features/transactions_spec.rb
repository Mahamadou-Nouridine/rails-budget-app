require 'rails_helper'

RSpec.feature "Transactions", type: :feature do
  before(:each) do
    @user = User.create(name: 'Nouridine', email: 'nouridine@gmail.com', password: 'abcdef')
    @category = @user.categorys.create(icon:"https://www.mcdonalds.com/content/dam/sites/usa/nfl/icons/arches-logo_108x108.jpg", name: "Macdo")
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'

  end

  describe "New and Create pages" do
    before do
      visit new_category_transaction_path(@category)
      fill_in 'transaction[name]', with: "milk"
      fill_in 'transaction[amount]', with: 12
    end

    it 'Displays create button' do
      page.should have_button("Create")
    end

    it "Submit the form" do
      click_button 'Create'
      expect(page).to have_content('Transaction created successfully')
      expect(page).to have_content('milk: $12')
      expect(page).to have_content('DETAILS')
    end

  end
end
