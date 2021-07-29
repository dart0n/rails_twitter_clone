require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { create(:user) }

    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a username' do
      user.username = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end

  describe 'tweets feed' do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet, user: user) }
    let(:unfollowed_tweet) { create(:tweet) }

    it "includes user's tweets" do
      expect(user.feed).to include tweet
    end

    it "doesn't includes unfollowed tweets" do
      expect(user.feed).to_not include unfollowed_tweet
    end
  end

  describe 'associations: following' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    it '.followers' do
      user1.follow(user2)
      expect(user2.followers).to include user1
    end

    it '.following' do
      user1.follow(user2)
      expect(user1.following).to include user2
    end

    it '.following?' do
      user1.follow(user2)
      expect(user1.following?(user2)).to be true
    end

    it 'user can unfollow' do
      user1.unfollow(user2)
      expect(user1.following?(user2)).to be false
    end
  end
end
