require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Test the Post validations:' do
    subject { Post.new(text: 'Hi there', title: 'Check', likes_counter: 0, comments_counter: 0) }
    before { subject.save }

    it 'Title should be given' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'Likes counter mus be bigger than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
    it 'Comments counter mus be bigger than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
    it 'Likes counter must be an integer' do
      subject.likes_counter = 'a'
      expect(subject).to_not be_valid
    end
    it 'Comments counter must be an integer' do
      subject.comments_counter = 'a'
      expect(subject).to_not be_valid
    end
  end

  describe 'Test the Post methode:' do
    user = User.new(name: "Adam", photo: "https://time.com/3393645/monkey-selfie-lands-photographer-in-legal-quagmire/", bio: "Friendly.", postscounter: 0)
    before { 8.times { Comment.new(post: subject, author: user, text: 'Happy to call.') } }

    it 'recent five posts should return 5 comments' do
      expect(subject.recent_comments).to eql(subject.comments.last(5))
    end
  end
end
