class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def show
  end

  def create
    @books = Book.new(book_params)
    
    if @books.save
      redirect_to new_book_path, :flash => { :success => "Book Added"}
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
  private
    def book_params
      params.require(:book).permit(:title, :author, :genre, :no_of_items)
    end  
  
end
