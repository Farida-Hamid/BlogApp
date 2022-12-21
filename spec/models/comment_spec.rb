require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Test the Comment methode:' do
    user = User.create(name: "Coco", photo: "https://time.com/3393645/monkey-selfie-lands-photographer-in-legal-quagmire/", bio: "Hate my name.", postscounter: 0)
    posts = Post.create(author: user, text: 'Why? I love it.', title: 'Objection', likes_counter: 0, comments_counter: 0)
    subject { Comment.new(post: posts, author: user, text: 'text') }
    before { subject.save }

    it 'comments counter should be incremented by 1' do
      expect(posts.comments_counter).to eql(1)
    end
  end
end
