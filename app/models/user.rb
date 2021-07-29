class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  # many to many relationship
  has_many :following_relationship, class_name:  'Following',
                                    foreign_key: 'follower_id',
                                    dependent:   :destroy
  has_many :followers_relationship, class_name:  'Following',
                                    foreign_key: 'followed_id',
                                    dependent:   :destroy

  has_many :following, through: :following_relationship, source: :followed
  has_many :followers, through: :followers_relationship, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def feed
    Tweet.where('user_id IN (?) OR user_id = ?', following_ids, id)
  end

  def follow(user)
    following_relationship.create(followed_id: user.id)
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    following.include?(user)
  end
end
