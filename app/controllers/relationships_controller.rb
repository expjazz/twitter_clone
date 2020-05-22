# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new
    relationship.follower = current_user
    relationship.followed = User.find(params[:User])
    relationship.save
  end
end
