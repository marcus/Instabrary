class BookStatusesController < ApplicationController
  def update
    book_status = BookStatus.find(params[:book_status])    
    
    if !book_status.active || book_status.active == 0
      book_status.active = 1
    else
      book_status.active = 0
    end
    
    if book_status.user_id == session[:user]
      book_status.save  
      @book_statuses = book_status.book.user_statuses(session[:user])
      
      respond_to do |format|
        format.js {
          render :update do |page|
            page.replace_html("statuses", :partial => 'books/statuses', :locals => { :book_statuses => @book_statuses })
          end 
        }
      end
    # TODO - Implement better handling here.
    else
      redirect_to '/'
    end	
  end
end
