require 'rails_helper'

RSpec.describe 'user/#index', type: :feature do
  before :each do
    visit users_path
    @users = User.all
  end
  describe 'users index view' do
    it 'should show the names of all users' do
      @users.each { |user| expect(page).to have_content(user.name) }
    end
    
    it 'should show the number of posts of each user' do
      @users.each { |user| expect(page).to have_content "Number of posts: #{user.postscounter}" }
    end

    it 'should show the profile picture of each user' do
      @users.each { |user| expect(page).to have_css("img[src*='#{user.photo}']") }
    end
  end

  context 'users show view' do
    before :each do
      @tom = User.create(name: 'Tom', photo: 'https://i.pinimg.com/736x/87/f7/6d/87f76d29e53a139f9ee74637636ba5b3.jpg', bio: 'A funny cat', postscounter: 2)

      @tom_post = Post.create([
                                { author: @tom, title: 'Disney Cat', text: 'I hate jerry', likes_counter: 2, comments_counter: 1 },
                                { author: @tom, title: 'Businessman', text: 'I love doing business', likes_counter: 0, comments_counter: 3}
                              ])
    end
    before(:example) { visit users_path(@tom) }
    it "displays a user's name" do
      expect(page).to have_content('Tom')
    end
    it 'displays the user profile picture' do
      expect(page).to have_css("img[src*='https://i.pinimg.com/736x/87/f7/6d/87f76d29e53a139f9ee74637636ba5b3.jpg']")
    end
    it 'I can see the number of posts the user has written' do
      expect(page).to have_content "Number of posts: #{@tom.postscounter}"
    end
    it 'displays the users bio' do
      expect(page).to have_content @tom.bio
    end
    it 'displays the first three posts' do
      @tom.recent_posts.each do |post|
        expect(page).to have_content post.text
      end
    end
    it 'I can see the button that lets me view all of a users posts' do
      expect(page).to have_content('See all posts')
    end
    it 'when I click to see all posts, it redirects me to the users posts index page' do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@tom))
    end

end
