# require 'rails_helper'

# RSpec.describe "Transactions", type: :request do
#   include Devise::Test::IntegrationHelpers


#   before(:each) do
#     @user = User.create(name: 'Nouridine', email: 'nouridine@gmail.com', password: 'abcdef')
#     @category = @user.categorys.create(icon:"https://www.mcdonalds.com/content/dam/sites/usa/nfl/icons/arches-logo_108x108.jpg", name: "Macdo")
#     sign_in @user
#   end

#   describe "GET :new and :create" do
#     before do
#       get new_category_transaction_path(@category)
#     end

#     it "success status" do
#       expect(response).to have_http_status(200)
#     end

#     it "should return the new page" do
#       expect(response).to render_template(:new)
#     end

#     it "should have the body content" do
#       expect(response.body).to include("New Transaction")
#     end
#   end
# end
