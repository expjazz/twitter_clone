# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all
    @friends = current_user.friends
  end

  def accept_request
    current_user.accept_friend(params[:id])
    redirect_to root_path
  end

  def search
    @users = User.all
    @friends = current_user.friends
    @user_result = User.search(params[:user])
    render 'users/index'
  end
end
