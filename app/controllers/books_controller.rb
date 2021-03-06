class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:success] = "Thank you for submitting a new book."
      redirect_to @book
    else
      render new 
    end
  end

  def index
    @books = Book.paginate(page: params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end
end
