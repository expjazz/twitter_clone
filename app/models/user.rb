# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :requests_sent, class_name: 'Relationship', foreign_key: 'follower_id'
  has_many :requests_received, class_name: 'Relationship', foreign_key: 'followed_id'
  has_many :following, through: :requests_sent, source: :followed
  has_many :followers, through: :requests_received, source: :follower

  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def display_image
    image.variant(resize_to_limit: [400, 400])
  end

  def add_friend(friend)
    following << friend
  end

  def accept_friend(friend_id)
    request = Relationship.find_by(follower_id: friend_id, followed_id: id)
    request.status = true
    request.save
  end

  def friendship_requests
    requests = []
    followers.each do |user|
      relationship = Relationship.find_by(follower_id: user.id, followed_id: id)
      requests << user if relationship.status != true
    end
    requests
  end

  def friends
    friends = []
    following.each do |user|
      relationship = Relationship.find_by(follower_id: id, followed_id: user.id)
      friends << user if relationship.status == true
    end
    friends
  end
end
