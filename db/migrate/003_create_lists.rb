class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :sets do |t|
      t.string :title
      t.text :description
      t.timestamps 
    end
    create_table :listings do |t|
      t.integer :book_id
      t.integer :set_id
      t.timestamps
    end
  end

  def self.down
    drop_table :sets
    drop_table :listings
  end
end

#members / components / elements / constituent / items
#list
#library
#shelf
#collection
#set
#group
#stack
#pile