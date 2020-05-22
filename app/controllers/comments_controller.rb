# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.user = current_user
    @comment.post_id = params[:post_id].to_i
    @comment.save
    redirect_to root_path
  end
end
