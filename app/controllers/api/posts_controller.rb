class Api::PostsController < ApplicationController

before_action :doorkeeper_authorize!

  def index
    @posts = Post.all
  end


  def show
    @post = Post.find_by id: params[:id]
  end
end
