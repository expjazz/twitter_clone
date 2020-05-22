# frozen_string_literal: true

class WelcomeController < ApplicationController
  def show
    @friends = current_user.friends
    @posts = Post.all
    @post = Post.new
  end
end
