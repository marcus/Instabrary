class Book < ActiveRecord::Base
  has_many :listings, :dependent => :destroy
  has_many :booksets, :through => :listings
  has_many :statuses, :through => :book_statuses
  cattr_reader :per_page
  @@per_page = 20
  has_ajaxful_rates
  
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

  def get_image(size)
    logger.info "COVER INFO FOR SIZE #{size} has? #{self.has_cover} and link #{self.medium_cover}"
    if self.has_cover
      case size
      when "small" : return "/covers/small/#{self.small_cover}"
      when "medium" : return "/covers/medium/#{self.medium_cover}"
      when "large" : return "/covers/large/#{self.large_cover}"
      end
    elsif self["#{size}_image"] 
      return  self["#{size}_image"]
    else
      # TODO Generate an awesome image.
      return "/images/default_covers/#{size}.png" 
    end
  end
end
