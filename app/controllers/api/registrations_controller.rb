class Api::RegistrationsController < ApplicationController
protect_from_forgery with: :null_session
 def create
      @user = User.new params.require(:user).permit(:username, :password)
      if @user.save
        # render api/registrations/user.json.jbuilder
        render :user
      else
        render json: @user.errors, status: 422
      end
    end
 end
