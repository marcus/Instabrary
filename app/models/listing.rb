class Listing < ActiveRecord::Base
  belongs_to :book
  belongs_to :bookset
end