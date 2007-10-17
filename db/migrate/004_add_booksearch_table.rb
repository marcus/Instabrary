class AddBooksearchTable < ActiveRecord::Migration
  def self.up
     create_table :booksearches do |t|
      t.string :keyword
      t.timestamps 
    end
  end

  def self.down
    drop_table :booksearches
  end
end
