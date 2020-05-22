# frozen_string_literal: true

class AddIndexToLikes < ActiveRecord::Migration[6.0]
  def change; end
  add_index :likes, :user_id
  add_index :relationships, :followed_id
  add_index :relationships, %i[follower_id followed_id], unique: true
end
