require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Test the User:" do
    subject { User.new(name: "User's name", photo: "User's photo", bio:"User's bio", postscounter: 0)}
    before {subject.save}

    it "Name should be given" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
