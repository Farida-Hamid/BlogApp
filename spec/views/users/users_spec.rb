require 'rails_helper'

RSpec.describe 'user/#index', type: :view do
  before :each do
    visit users_path
    @users = user.all
  end
  describe 'users index view' do
    it 'should show the names of all users' do
      @users.each { |user| expect(page).to have_content(user.name) }
    end
  end
end
