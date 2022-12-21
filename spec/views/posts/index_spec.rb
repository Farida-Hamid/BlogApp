require 'rails_helper'

RSpec.describe 'post index/#html', type: :feature do
  before :each do
    @user1 = User.create(name: 'Farida', photo: 'https://mario.wiki.gallery/images/3/3e/MPSS_Mario.png',
                         bio: 'Web developer', postscounter: 2)
    @user1_post = Post.create(author: @user1, title: 'Mario universe', text: 'Super mario bros', likes_counter: 2,
                              comments_counter: 1)
    Comment.create(post: @user1_post, author: @user1, text: 'I love mario')
  end

  before(:example) { visit user_posts_path(@user1) }

  describe 'Index page' do
    it 'I can see the users username' do
      expect(page).to have_content(@user1.name)
    end
    it 'I can see the users profile picture' do
      expect(page).to have_css("img[src*='https://mario.wiki.gallery/images/3/3e/MPSS_Mario.png']")
    end
  end
end
