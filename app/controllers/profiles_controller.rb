require 'rubygems'
require 'linguistics'
Linguistics::use( :en )

class ProfilesController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @booksets = Bookset.find_all_by_user_id(@user)
    
    @statuses = BookStatus.find_all_by_user_id(@user)
    
    @own, @wants, @reading, @read, @toread, @part = [],[],[],[],[],[]
        
    @statuses.each { |s|
      if(s.active == true)
        case s.status.name
          when "Own"
            @own << s.book
          when "Want"
            @wants << s.book
          when "Reading"
            @reading << s.book
          when "Read"
            @read << s.book
          when "To-read"
            @toread << s.book
          when "Read part"
            @part << s.book 
        end
      end
    }
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
end
