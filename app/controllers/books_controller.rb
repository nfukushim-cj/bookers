class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new()
  end

  def create
    @book = Book.new(book_params)
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book.id)
    else
      #全ての書籍を再取得する
      @books = Book.all
      flash.now[:alert] = "error"
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "error"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
     flash[:notice] = "Book was successfully destroyed."
     redirect_to books_path
    else
      flash.now[:alert] = "error"
      render :index
    end
  end

  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
