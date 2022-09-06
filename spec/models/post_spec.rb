require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.new(name: 'Stan', photo: '_url_', bio: 'nigeria')
    Post.create(title: 'baseLine', text: 'This is my post', comments_counter: 0, likes_counter: 0, user_id: user.id)
  end

  before { subject.save }

  it 'author_id should be present' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be a greter than or equal to 0' do
    expect(subject.comments_counter).to be >= 0
  end

  it 'likes_counter should be a greter than or equal to 0' do
    expect(subject.likes_counter).to be >= 0
  end

  it 'text should be less than 250 characters' do
    subject.title = 'Lorem Ipsum is simply dummy text of the
    printing and typesetting industry. Lorem Ipsum has been the industry
    standard dummy text ever since the 1500s, when an unknown printer took a galley
    of type and scrambled it to make a type specimen book. It has survived not only
    five centuries'
    expect(subject).to_not be_valid
  end
end
