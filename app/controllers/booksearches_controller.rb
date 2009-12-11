class BooksearchesController < ApplicationController

  # GET /booksearches/1
  # GET /booksearches/1.xml
  def show
    @booksearch = Booksearch.find(params[:id])
    @page_title = "Books matching #{@booksearch.keyword} on Instabrary"
    @results = Booksearch.search_by_keyword(@booksearch.keyword)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @booksearch }
    end
  end

  # GET /booksearches/new
  # GET /booksearches/new.xml
  def new
    @booksearch = Booksearch.new
    @booksearch.bookset_id = params[:bookset]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @booksearch }
    end
  end


  # POST /booksearches
  # POST /booksearches.xml
  def create
    if params[:booksearch]
      @booksearch = Booksearch.new(params[:booksearch])
    else
      @booksearch = Booksearch.new
      @booksearch.keyword = params[:keyword]
    end
    if session[:user]
      @booksearch.user_id = session[:user].id
    end
    
    respond_to do |format|
      if @booksearch.save
        flash[:notice] = 'Booksearch was successfully created.'
        format.html { redirect_to(@booksearch) }
        format.xml  { render :xml => @booksearch, :status => :created, :location => @booksearch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @booksearch.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  private
  
end
