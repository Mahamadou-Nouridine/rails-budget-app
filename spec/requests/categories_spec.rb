require 'rails_helper'

RSpec.describe "Categories", type: :request do
  include Devise::Test::IntegrationHelpers


  before(:each) do
    @user = User.create(name: 'Nouridine', email: 'nouridine@gmail.com', password: 'abcdef')
    sign_in @user
  end

  describe "GET /categorys" do
    before do
      get "/"
    end

    it "returns a success status" do
      expect(response).to have_http_status(200)
    end

    it 'Displays the index' do
      expect(response).to render_template(:index)
    end

    it 'Returns the body holder' do
      expect(response.body).to include("You don't have any registered category!")
    end
  end

  describe 'GET /create' do
    before do
      get "/categorys/new"
    end

    it 'Returns a success link' do
      expect(response).to have_http_status(:success)
    end

    it 'Displays the new page' do
      expect(response).to render_template(:new)
    end

    it 'Returns the body content' do
      expect(response.body).to include('New Category')
    end
  end

  describe 'GET /categorys/:id (:show)' do
    before do
      @category = @user.categorys.create(icon:"https://www.mcdonalds.com/content/dam/sites/usa/nfl/icons/arches-logo_108x108.jpg", name: "Macdo")
      get "/categorys/#{@category.id}/"
    end
    it 'Displays a success' do
      expect(response).to have_http_status(:success)
    end

    it 'Displays the show' do
      expect(response).to render_template(:show)
    end

    it 'Includes category name in the response' do
      expect(response.body).to include(@category.name)
    end
  end
end
