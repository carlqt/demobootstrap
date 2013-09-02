class BorrowController < ApplicationController
  
  
  
  def show
    @book = Book.find(params[:id])
    @books = Book.new

  end
  
  def update
    @book = Book.find(params[:id])
    @book.no_of_items -= 1
    
    @books = @book
    
    if @book.update_attributes(params[:book])
      redirect_to books_show_all_path, :notice => "Update Successful"
    else
      
      if @book.no_of_items < 0
        @book.no_of_items = 0
      end
      
      @var = "book"
      @command = "borrowed"
      render "show"
    end
  end
end
