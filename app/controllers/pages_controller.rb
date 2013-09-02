class PagesController < ApplicationController
  def home
  end
  
  def profile
    
    @profile = User.find(params[:id])  # params[:id] => 5
    #@prev_id = nil
  end
  
  def return
    @loan_profile = Loan.find(params[:id])
    @loan_profile.return_date = Time.now
    @loan_profile.save
    
    @book_profile = Book.find(@loan_profile.book_id)
    @book_profile.no_of_items += 1
    @book_profile.save
    flash[:notice] = "Book Returned Successfully"
    
    redirect_to :controller=>'pages',:action=>'profile', :id => current_user.id
  end
end
