class Bookset < ActiveRecord::Base
  belongs_to :user
  has_many :listings, :dependent => :destroy
  has_many :books, :through => :listings
  
  validates_presence_of     :title
end