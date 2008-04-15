class BooksController < ApplicationController
  # GET /books
  # GET /books.xml
  
  def index
    if(params[:bookset_id])
      @bookset = Bookset.find(params[:bookset_id])
      @books = @bookset.books.paginate :page => params[:page]
    else
      @books = Book.find(:all).paginate :page => params[:page]
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    # DRY finding user (before_filter or something similar)
    if(session[:user])
      @user = User.find(session[:user])
    end
    @book = Book.find(params[:id])
    @page_title = "#{@book.title} on Instabrary"

    @book_statuses = @book.user_statuses(session[:user]) if session[:user]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    #@book = Book.new(params[:book])
    @book = Book.find(params[:book] )

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(@book) }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end


  def rate
    if(session[:user])
      @user = User.find(session[:user])
    end
    @book = Book.find(params[:id])
    @book.rate(params[:stars], @user)
    
    respond_to do |format|
      format.js {
        render :update do |page|
          page.replace 'stars', :partial => 'stars', :locals => {:user => @user, :book => @book}
        end 
      }
    end
  end
  
end
