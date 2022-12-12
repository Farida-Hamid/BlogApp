require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Test the Post:" do
    subject { Post.new(text: "post text", title: "title", likes_counter: 0, comments_counter: 0)}
    before {subject.save}

    it "Title should be given" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it "Likes counter mus be bigger than or equal to zero" do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
    it "Comments counter mus be bigger than or equal to zero" do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
    it "Likes counter must be an integer" do
      subject.likes_counter = "a"
      expect(subject).to_not be_valid
    end
    it "Comments counter must be an integer" do
      subject.comments_counter = "a"
      expect(subject).to_not be_valid
    end
  end
end