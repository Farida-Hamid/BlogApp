require 'rails_helper'

RSpec.describe 'post index/#html', type: :feature do
  before :each do
    @user1 = User.create(name: 'Farida', photo: 'https://mario.wiki.gallery/images/3/3e/MPSS_Mario.png',
                         bio: 'Web developer', postscounter: 2)
    @user1_post = Post.create(author: @user1, title: 'Mario universe', text: 'Super mario bros', likes_counter: 2,
                              comments_counter: 1)
    @comment = Comment.create(post: @user1_post, author: @user1, text: 'I love mario')
  end

  before(:example) { visit user_posts_path(@user1) }

  describe 'Index page' do
    it 'I can see the users username' do
      expect(page).to have_content(@user1.name)
    end

    it 'I can see the users profile picture' do
      expect(page).to have_css("img[src*='https://mario.wiki.gallery/images/3/3e/MPSS_Mario.png']")
    end

    it 'should have the post title' do
      visit("users/#{@user1.id}/posts")
 
      expect(page).to have_content(@user1_post.title)
    end

    it 'should have the post body' do
      visit("users/#{@user1.id}/posts")
 
      expect(page).to have_content @user1_post.text
    end

    it 'should see some posts comments' do
      visit("users/#{@user1.id}/posts")
 
      expect(page).to have_content @comment.text
    end

    it 'should have comment number' do
      visit("users/#{@user1.id}/posts")
 
      expect(page).to have_content "Comments: #{@user1_post.comments_counter}"
    end

    it 'should have likes number' do
      visit("users/#{@user1.id}/posts")
 
      expect(page).to have_content "Likes: #{@user1_post.likes_counter}"
    end

    it 'should have pagination post fit the view' do
      visit("users/#{@user1.id}/posts")
 
      expect(page).to have_content 'Pagination'
    end

    it 'should redirect to a post' do
      visit("users/#{@user1.id}/posts")
      click_link "Post #"
      expect(current_path).to eq(user_post_path(@user1, @user1_post.id))
    end
  end
end
