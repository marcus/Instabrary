class AddBookStatuses < ActiveRecord::Migration
  
  def self.up
    
    create_table :statuses do |t|
        t.string :name
        t.text :description
        t.timestamps
    end
    
    statuses = ["Own", "Want", "Reading", "Read", "To-read", "Read part"]
    statuses.each do |status|
      s = Status.new
      s.name = status
      s.save
    end
    
    create_table :book_statuses do |t|
        t.integer :user_id, :book_id, :status_id
        t.integer :book_id
        t.integer :status_id
        t.boolean :active, :default => false
        t.timestamps
    end
    
  end

  def self.down
    drop_table "statuses"
    drop_table "book_statuses"
  end
end
