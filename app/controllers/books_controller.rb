class BooksController < ApplicationController
 

  def show
    @book = Book.find(params[:id])
  end

  def new
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book.id)
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
   
    redirect_to book_path(book), notice: "Book was successfully updated."
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    if  book.destroy
      redirect_to books_new_path, notice: "Book was successfully destroyed."
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
