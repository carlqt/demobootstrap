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
  
  def edit
    @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
    
    if @book.update_attributes(book_params)
      redirect_to books_show_all_path, :flash => { :success => "Update Successful" }
    else
      render "edit"
    end
  end

  def destroy
  end
  
  def show_all
    @books = Book.all
    @column_names = Book.column_names    
  end
  
  def search
    @books = Book.search(params[:search])
    
    @column_names = Book.all.column_names
    
    
  end
  
  private
    def book_params
      params.require(:book).permit(:title, :author, :genre, :no_of_items)
    end  
  
end
