class AddBooksetIdToBooksearch < ActiveRecord::Migration
  def self.up
    add_column :booksearches, :bookset_id, :integer
  end

  def self.down
  end
end
