class Api::PostsController < ApplicationController

before_action :doorkeeper_authorize!
protect_from_forgery with: :null_session

  def index
    @posts = Post.all
    #add pagination with kaminari
    #add date filtering
    #add sorting by date
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  def create
    @post = Post.new params.require(:post).permit(:title)
     if @post.save
       render :show
     else
       render json: @post.errors, status: 422
     end
  end

  def update
    @post = Post.find_by id: params[:id]
     if @post.update params.require(:post).permit(:user_id, :title, :post_text)
       render :show
     else render json: @post.errors, status: 422
  end
end

  def delete
    @post = Post.find_by id: params[:id]
    @post.destroy
    head :ok
  end
end
