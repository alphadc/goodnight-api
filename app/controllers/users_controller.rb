class UsersController < ApplicationController
	def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def follow
	  @user = User.find(params[:target_id])
	  current_user = User.find(params[:id])
	  if !(current_user.followees.include?(@user))
	    current_user.followees << @user
	    render json: {message: "follow", status: "success"}
	  else      
	    render json: {message: "already follow", status: "failed"}
	  end
	end

	def unfollow
	  @user = User.find(params[:target_id])
	  current_user = User.find(params[:id])
	  if (current_user.followees.include?(@user))
	    current_user.followed_users.find_by(followee_id: @user.id).destroy
	    render json: {message: "unfollow", status: "success"}
	  else      
	    render json: {message: "already unfollow", status: "failed"}
	  end
	end
end
