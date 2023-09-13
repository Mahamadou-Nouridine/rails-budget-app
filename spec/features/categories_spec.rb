require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before(:each) do
    @user = User.create(name: 'Nouridine', email: 'nouridine@gmail.com', password: 'abcdef')
    @category = @user.categorys.create(
      icon: 'https://www.mcdonalds.com/content/dam/sites/usa/nfl/icons/arches-logo_108x108.jpg', name: 'Macdo'
    )
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
  end

  describe 'show page' do
    before do
      visit category_path(@category)
    end
    it 'Displays a Category name' do
      expect(page).to have_content(@category.name)
    end

    it 'Displays the category transactions' do
      expect(page).to have_content('This Category is empty!')
    end

    it 'Displays Total Amount' do
      expect(page).to have_content('TOTAL AMOUNT:')
    end

    it 'Displays add new transaction button' do
      page.should have_button('Add New Transaction')
    end
  end

  describe 'index page' do
    before do
      visit categorys_path
    end

    it 'Displays a Category name' do
      expect(page).to have_content(@category.name)
    end

    it 'the page title' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'Displays Total Amount' do
      expect(page).to have_content('$0')
    end

    it 'Displays add new Category button' do
      page.should have_button('Add New Category')
    end
  end

  describe 'New and create' do
    before do
      visit new_category_path
      fill_in 'category[name]', with: 'KFC'
      fill_in 'category[icon]', with: 'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60'
      click_button 'Create'
    end

    it 'Displays th Category name' do
      expect(page).to have_content('KFC')
    end

    it 'Displays the notice flash' do
      expect(page).to have_content('Category created successfully')
    end
  end
end
