require 'rails_helper'

describe Post, type: :feature do
  before :each do
    @user1 = User.create(
      name: 'Samy',
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkucjJTU_QQmoqHOAt8OsYC5f9U1XFxuqkKkQSGJ9m&s',
      bio: 'I have two sons.',
      postscounter: 3
    )
    @user2 = User.create(
      name: 'Sally',
      photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkucjJTU_QQmoqHOAt8OsYC5f9U1XFxuqkKkQSGJ9m&s',
      bio: 'I\'m a dentist',
      postscounter: 0
    )
     
    @post1 = Post.create(title: 'Gerrting', text: 'Hi there, everyone.', comments_counter: 0, likes_counter: 0, author: @user1)

    @comment = Comment.create(text: 'Hi how are you?', author: @user2, post: @post1)

    visit("users/#{@user1.id}/posts/#{@post1.id}")
  end
  it 'should have the post title' do
    expect(page).to have_content(@post1.id)
  end

  it 'should have the post\'s author' do
    expect(page).to have_content(@post1.author.name)
  end

  it 'should have the post\'s comments count' do
    expect(page).to have_content("Comments: #{@post1.comments_counter}")
  end

  it 'should have the post\'s likes count' do
    expect(page).to have_content("Likes: #{@post1.likes_counter}")
  end

  it 'should have the post\'s likes count' do
    expect(page).to have_content(@post1.text)
  end

  it 'should have the commentor name' do
    expect(page).to have_content @comment.author.name
  end

  it 'should have the commentor comment he left' do
    expect(page).to have_content @comment.text
  end
end