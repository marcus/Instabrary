class HomeController < ApplicationController
  def index
    @booksets = Bookset.find(:all, :limit => 15, :order => 'rand()')
  end
end