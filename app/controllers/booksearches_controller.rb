class BooksearchesController < ApplicationController

  # GET /booksearches/1
  # GET /booksearches/1.xml
  def show
    @booksearch = Booksearch.find(params[:id])
    @page_title = "Books matching #{@booksearch.keyword} on Instabrary"
    search_results = search_amazon(@booksearch.keyword)
    @results = Array.new
    
    return if !search_results
    
    search_results.each do |result|
      #TODO - Make sure a bad result doesn't clobber a good one.
      book = Book.find_or_create_by_isbn_and_title(result.get('asin'), result.get('title'))
      book.authors = result.get_array('author')*", "
      book.editorial_review_source = result.get_unescaped('editorialreview/source')
      book.editorial_review = result.get_unescaped('editorialreview/content')
      book.affiliate_link = "http://www.amazon.com/exec/obidos/ASIN/#{book.isbn}/"
      book.large_image = result.get('largeimage/url')
      book.medium_image = result.get('mediumimage/url')
      book.small_image = result.get('smallimage/url')
      book.pages = result.get('numberofpages')
      book.binding = result.get('binding')
      book.label = result.get('label')
      book.edition = result.get('edition')
      book.publisher = result.get('publisher')
      book.release_date = result.get('releasedate')
      book.list_price = result.get('listprice/amount')
      book.lowest_new_price = result.get('lowestnewprice/amount')
      book.small_image_height = result.get('smallimage/height')
      book.small_image_width = result.get('smallimage/width')
      book.medium_image_height = result.get('mediumimage/height')
      book.medium_image_width = result.get('mediumimage/width')
      book.large_image_height = result.get('largeimage/height')
      book.large_image_width = result.get('largeimage/width')
      book.save
      
      @results.push book
    end
    
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
    @booksearch = Booksearch.new(params[:booksearch])
    @booksearch.user_id = session[:user].id
    
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
  
  def search_amazon(keyword)
    results = Amazon::Ecs.item_search(keyword, :response_group => 'Medium', :sort => 'relevancerank')
    if results.has_error?
      return
    end
    results.items
  end

end
