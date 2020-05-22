# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    byebug
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update; end

  def destroy; end

  def index; end

  private

  def post_params
    params.require(:post).permit(:body, :title, :image)
  end
end
