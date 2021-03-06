class BooksetsController < ApplicationController
  before_filter :verify_logged_in, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :get_bookset, :except => [:index, :new, :create]
  
  def index
    if !params[:user_id]
      @booksets = Bookset.paginate(:page => params[:page], :order => "created_at DESC")
      
    else
      @user = User.find(params[:user_id])
      @booksets = Bookset.paginate_all_by_user_id(params[:user_id], :page => params[:page], :order => "created_at DESC")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @booksets }
    end
  end

  def show
    @page_title = "#{@bookset.title} on Instabrary"
    @booksearch = Booksearch.new
    @total_books = @bookset.books.length
    @total_pages = @bookset.books.inject(0) do |sum, book|
      if book.pages
        sum += book.pages
      end
      sum
    end
    @set_creator = @bookset.user
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bookset }
      format.json { render :json => @bookset.to_json(:include => :books)}
    end
  end

  def new
    @bookset = Bookset.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bookset }
    end
  end

  def edit    
    return unless check_ownership(@bookset)
  end

  # POST /booksets
  # POST /booksets.xml
  def create
    @bookset = Bookset.new(params[:bookset])
    @bookset.user_id = session[:user]
    
    respond_to do |format|
      if @bookset.save
        flash[:notice] = 'Bookset was successfully created.'
        format.html { redirect_to(@bookset) }
        format.xml  { render :xml => @bookset, :status => :created, :location => @bookset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /booksets/1
  # PUT /booksets/1.xml
  def update
    return unless check_ownership(@bookset)

    respond_to do |format|
      if @bookset.update_attributes(params[:bookset])
        flash[:notice] = 'Bookset was successfully updated.'
        format.html { redirect_to(@bookset) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bookset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /booksets/1
  # DELETE /booksets/1.xml
  def destroy
    return unless check_ownership(@bookset)
    
    @bookset.destroy
    
    respond_to do |format|
      format.html { redirect_to(booksets_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def get_bookset
    @bookset = Bookset.find(params[:id].match(/_(\d+)\z/)[0])
  end
end
