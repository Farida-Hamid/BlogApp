require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Test the Comment methode:' do
    user = User.create(name: "Sally", photo: "https://time.com/3393645/monkey-selfie-lands-photographer-in-legal-quagmire/", bio: "I'm a cartoon.", postscounter: 0)
    post = Post.create(author: user, text: 'I love you.', title: 'Call me', likes_counter: 0, comments_counter: 0)
    subject { Like.new(post: post, author: user) }
    before { subject.save }

    it 'comments counter should be incremented by 1' do
      expect(post.likes_counter).to eql(1)
    end
  end
end
