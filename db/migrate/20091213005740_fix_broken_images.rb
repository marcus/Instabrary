class FixBrokenImages < ActiveRecord::Migration
  def self.up
    Book.all.each {|b| 
      if b.small_image && !b.small_cover
        puts "Attempting to download image for #{b.id} - #{b.title}"
        if HTTParty.get(b.small_image).nil?
          puts "Failed, removing images"
          b.small_image = nil
          b.medium_image = nil
          b.large_image = nil

          b.small_image_height = nil
          b.small_image_width = nil
          b.medium_image_height = nil
          b.medium_image_width = nil
          b.large_image_height = nil
          b.large_image_width = nil
          b.save
        else
          puts "Succeeded, downloading remaining cover images"
          Book.download_book_cover(b)
        end
        puts "\n"
      end 
    }
  end

  def self.down
  end
end
