# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @friends = current_user.friends
  end

  def accept_request
    current_user.accept_friend(params[:id])
  end
end
