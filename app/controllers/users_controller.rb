class UsersController < ApplicationController

	before_action :correct_user, only:[:edit, :update]

	def index
		@users = User.all
		@user = User.find(current_user.id)
		@book = Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = Book.where(user_id:params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to user_path(current_user.id), notice:"You have updated user successfully."
		else
			# @user = User.new(user_params)
			# flash.now[:alert] ="失敗！！"
			# render "edit"
			# redirect_to user_path(current_user.id), notice:"ユーザー名を入力してください！ユーザー名は2~20文字、自己紹介文は50文字以内で入力してください！！"

			render "edit"
		end
	end



	private
	def user_params
			params.require(:user).permit(:name, :introduction, :profile_image)
	end

	def correct_user
		user = User.find(params[:id])
		if current_user != user
			redirect_to user_path(current_user.id)
		end
	end
end
