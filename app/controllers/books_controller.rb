class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  def main
    # 静的なページ
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all

    if @book.save
      redirect_to book_path(@book[:id]), notice: 'Book was successfully created.'
    else
      render 'index'
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path(params[:id]), notice: 'Book was successfully updated.'
    else
      render 'edit'
    end

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
