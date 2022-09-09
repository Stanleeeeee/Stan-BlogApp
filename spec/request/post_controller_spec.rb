require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET #index' do
    before(:each) { get user_posts_path(1) } # get(:index)
    it 'it renders succesfully' do
      expect(response).to have_http_status(:ok)
    end

    it "it shows the 'index' template correctly" do
      expect(response).to render_template('index')
    end

    it 'it shows "Below is the list of posts for a user" correctly' do
      expect(response.body).to include('Below is the list of posts for a user')
    end
  end

  context 'GET #index' do
    before(:each) { get '/users/1/posts/1' } # gets(:show, params: { id: 1 })
    it 'it renders succesfully' do
      expect(response).to have_http_status(:success)
    end

    it "it renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'it shows "Here is a list of users" correctly' do
      expect(response.body).to include('Details of a user')
    end
  end
end
