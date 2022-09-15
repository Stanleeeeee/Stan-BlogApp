require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    user = User.new(name: 'Stan', photo: '_url_', bio: 'nigeria')
    post = Post.create(title: 'baseLine', text: 'This is my post', comments_counter: nil, likes_counter: 0,
                       user_id: user.id)
    Comment.create(text: 'This is my post', user_id: user.id, post_id: post.id)
  end

  before { subject.save }
  it 'user id not valid' do
    subject.user_id = 1
    expect(subject).to_not be_valid
  end

  it 'post id not valid' do
    subject.post_id = 1
    expect(subject).to_not be_valid
  end
end
