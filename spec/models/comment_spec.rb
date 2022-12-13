require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Test the Comment methode:" do
    user = User.create(name: "User's name", photo: "User's photo", bio:"User's bio", postscounter: 0)
    posts = Post.create(author: user, text: "post text", title: "title", likes_counter: 0, comments_counter: 0)
    subject { Comment.new(post: posts, author: user, text: 'text') }
    before { subject.save }

    it 'comments counter should be incremented by 1' do
      expect(posts.comments_counter).to eql(1)
    end
  end
end