class Booksearch < ActiveRecord::Base
  belongs_to :bookset
  belongs_to :user
  validates_presence_of     :keyword
end