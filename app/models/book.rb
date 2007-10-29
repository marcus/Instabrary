class Book < ActiveRecord::Base
  has_many :listings, :dependent => :destroy
  has_many :booksets, :through => :listings
  has_many :statuses, :through => :book_statuses
  cattr_reader :per_page
  @@per_page = 20
  
  def link
    the_link = "#{affiliate_link}besttoolforth-20"
  end
    
  def user_statuses(user_id)
    book_statuses = []
    Status.find(:all).each do |status|
      book_statuses << BookStatus.find_or_create_by_book_id_and_status_id_and_user_id(id, status.id, user_id)
    end
    book_statuses
  end
end