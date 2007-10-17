class Book < ActiveRecord::Base
  has_many :listings, :dependent => :destroy
  has_many :booksets, :through => :listings
    
  def link
    the_link = "#{affiliate_link}besttoolforth-20"
  end
end