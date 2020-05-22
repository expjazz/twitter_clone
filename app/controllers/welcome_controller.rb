# frozen_string_literal: true

class WelcomeController < ApplicationController
  def show
    @friends = current_user.friends
    @posts = Post.all
  end
end
