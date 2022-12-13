require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Test the User class validation:" do
    subject { User.new(name: "User's name", photo: "User's photo", bio:"User's bio", postscounter: 0)}
    before {subject.save}

    it "Name should be given" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it "Posts counter mus be bigger than or equal to zero" do
      subject.postscounter = -1
      expect(subject).to_not be_valid
    end
    it "Posts counter must be an integer" do
      subject.postscounter = "a"
      expect(subject).to_not be_valid
    end
  end

  describe "Test the User class methode:" do
    before { 5.times { Post.create(author: subject, title: 'title', text: 'post text') } }

    it "Test the recent post methode" do
      expect(subject.recent_posts).to eql(subject.posts.last(3))
    end
  end
end
