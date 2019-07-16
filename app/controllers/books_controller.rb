class BooksController < ApplicationController
	def index
		@user = User.find(current_user.id)
		@book = Book.new
		@books = Book.all
  end

  def show
  end

  def edit
  end
end
