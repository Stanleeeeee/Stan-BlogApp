require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = User.new(name: 'Example User',
                     photo: 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
                     bio: 'a short bio', posts_counter: 0)
    @post = @user.posts.build(title: 'Lorem ipsum', text: 'some posts made', comments_counter: 0, likes_counter: 0)
    @like = @post.likes.build(user_id: @user.id)
  end
  it 'is not valid without a user_id' do
    @like.user_id = nil
    expect(@like).to_not be_valid
  end
  it 'is not valid without a post_id' do
    @like.post_id = nil
    expect(@like).to_not be_valid
  end
  it 'updates the likes_counter' do
    expect(@post.likes_counter).to eq(0)
  end
end
