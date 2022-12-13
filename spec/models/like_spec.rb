require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Test the Comment methode:' do
    user = User.create(name: "User's name", photo: "User's photo", bio: "User's bio", postscounter: 0)
    post = Post.create(author: user, text: 'post text', title: 'title', likes_counter: 0, comments_counter: 0)
    subject { Like.new(post: post, author: user) }
    before { subject.save }

    it 'comments counter should be incremented by 1' do
      expect(post.likes_counter).to eql(1)
    end
  end
end
