class HomeController < ApplicationController
  def index
    @booksets = Bookset.find(:all, :limit => 15, :order => "created_at DESC")
  end
end