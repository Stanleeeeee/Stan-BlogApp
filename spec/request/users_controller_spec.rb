require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET #index' do
    before(:each) { get users_path } # get(:index)
    it 'it renders succesfully' do
      expect(response).to have_http_status(:ok)
    end
    it "it shows the 'index' template correctly" do
      expect(response).to render_template('index')
    end

    it 'it shows "Here is a list of users" correctly' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  context 'GET /show' do
    it 'it renders succesfully' do
      expect(response).to have_http_status(:success)
    end
    it 'it renders show template' do
      get '/users/show'
      expect(response).to render_template(:show)
    end
    it 'it shows Here the details of a user: Name, Photo, Bio, and Posts" correctly' do
      expect(response.body).to include('Here the details of a user: Name, Photo, Bio, and Posts')
    end
  end
end
