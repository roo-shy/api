class Api::PostsController < ApplicationController

  def index
    @posts = Post.all
  end


  def show
    @post = Post.find_by id: params[:id]
  end
end
