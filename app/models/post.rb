# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes
  has_many :comments

  def likes_finder(user)
    likes.each do |like|
      return false if like.user == user
    end
    true
  end

  def comments_valid
    comments || []
  end

  def self.search(param)
    all = Post.all
    all.select { |post| post.body.include?(param) }
  end
end
