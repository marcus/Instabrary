class Booksearch < ActiveRecord::Base
  belongs_to :bookset
  belongs_to :user
end