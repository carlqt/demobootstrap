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
      loan_book @book.id
      redirect_to books_show_all_path, :notice => "You have borrowed #{@book.title}"
    else
      
      if @book.no_of_items < 0
        @book.no_of_items = 0
      end
      
      @var = "book"
      @command = "borrowed"
      render "show"
    end
  end
  
  private
    def loan_book(book_id)
      if user_signed_in?
        
        loan = Loan.new()
        loan.book_id = book_id
        loan.user_id = current_user.id
        loan.loan_date = Time.now
    
        loan.save
      end 
    end
    
   
end
