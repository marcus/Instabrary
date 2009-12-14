class HomeController < ApplicationController
  def index
    @booksets = Bookset.find(:all, :limit => 15, :order => 'rand()')
    #Bookset.find(:all, :select => 'booksets.*, count(listings.id) as listing_count',:joins => 'left outer join listings on listings.bookset_id=booksets.id', :group => 'booksets.id')
  end
end
