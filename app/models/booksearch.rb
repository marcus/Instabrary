class Booksearch < ActiveRecord::Base
  belongs_to :bookset
  belongs_to :user
  validates_presence_of     :keyword

  def self.search_by_keyword(keyword)
    search_results = Amazon::Ecs.item_search(keyword, :response_group => 'ListmaniaLists,Medium', :sort => 'relevancerank')
    return [] if search_results.has_error? || !search_results
    
    @results = Array.new
    
    search_results.items.each do |result|
      #TODO - Make sure a bad result doesn't clobber a good one.
      book = Book.find_or_initialize_by_isbn_and_title(result.get('asin'), result.get('title'))
      book.authors = result.get_array('author')*", "
      book.editorial_review_source = result.get_unescaped('editorialreview/source')
      book.editorial_review = result.get_unescaped('editorialreview/content')
      book.affiliate_link = "http://www.amazon.com/exec/obidos/ASIN/#{book.isbn}/"
      book.large_image = result.get('largeimage/url')
      book.medium_image = result.get('mediumimage/url')
      book.small_image = result.get('smallimage/url')
      book.pages = result.get('numberofpages')
      book.book_binding = result.get('binding')
      book.label = result.get('label')
      book.edition = result.get('edition')
      book.publisher = result.get('publisher')
      book.publication_date = result.get('publicationdate')
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

    @results
  end
end
