require 'rails_helper'
RSpec.describe 'Post', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos1', bio: 'Teacher from Mexico.')
    @user.posts.create(title: 'Title', text: 'Body')
    visit user_post_path(@user, @user.posts.first)
  end
  context 'Post show page' do
    it 'Should display post\s title' do
      expect(page).to have_content('Title')
    end
    it 'Should display post author name' do
      expect(page).to have_content('by Tom')
    end
    it 'should display post s comment counter' do
      expect(page).to have_content('Comments: 0')
    end
    it 'should display post s likes counter' do
      expect(page).to have_content('Likes: 0')
    end
    it 'Should display post\s text' do
      expect(page).to have_content('Body')
    end
    it 'Should display comment user name' do
      @user.posts.first.comments.create(text: 'Comment', author: @user)
      visit user_post_path(@user, @user.posts.first)
      expect(page).to have_content('Tom')
    end
  end
end
