class BooksController < ApplicationController

	before_action :correct_user, only:[:edit, :update]

	def index
		@user = User.find(current_user.id)
		@book = Book.new
		@books = Book.all
	end


def create
	@book = Book.new(book_params)
	@book.user_id = current_user.id
	if @book.save
		redirect_to book_path(@book.id), notice:"You have creatad book successfully."
	else
		# redirect_to books_path
		@user = User.find(current_user.id)
		@books = Book.all
		render "index"
	end
end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@book_new = Book.new
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(params[:id]), notice:"You have updated book successfully."
		else
			# redirect_to book_path(params[:id]), notice:"タイトルと感想文を記入してください！200文字以内で入力してください！！"
			render "edit"
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
		def book_params
				params.require(:book).permit(:title, :body, :user_id)
		end

		def correct_user
			book = Book.find(params[:id])
			if current_user != book.user
				redirect_to books_path
			end
		end
end
