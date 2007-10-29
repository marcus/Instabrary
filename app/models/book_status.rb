class BookStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  belongs_to :status
end
