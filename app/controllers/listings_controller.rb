class ListingsController < ApplicationController
  
  # DELETE /listings/1
  # DELETE /listings/1.xml
  def destroy
    @listing = Listing.find(params[:id])
    return unless check_ownership(@listing.bookset)
    bookset = @listing.bookset
    
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "booksets", :action => :show, :id => bookset) }
      format.xml  { head :ok }
    end
  end
  
  # POST /listings
  # POST /listings.xml
  def create
    @bookset = Bookset.find(params[:bookset])
    go_home if !check_ownership(@bookset)

    @book = Book.find(params[:book] )
    @listing = Listing.new
    @listing.book = @book
    @listing.bookset = @bookset
    @listing.save

    respond_to do |format|
      if @listing.save
        flash[:notice] = 'The book was successfully added.'
        format.html { redirect_to(@bookset) }
        format.xml  { render :xml => @bookset, :status => :created, :location => @bookset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bookset.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
