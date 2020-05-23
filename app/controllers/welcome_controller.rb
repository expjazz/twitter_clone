# frozen_string_literal: true

class WelcomeController < ApplicationController
  def show
    @friends = current_user.friends
    @posts = Post.all
    @post = Post.new
  end

  def search
    @friends = current_user.friends
    @posts = Post.all
    @post = Post.new
    @post_result = Post.search(params[:post])
    render 'welcome/show'
  end
end
