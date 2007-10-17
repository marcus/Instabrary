class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps 
    end
    create_table :authorships do |t|
      t.integer :author_id
      t.integer :book_id
      t.timestamps
    end
  end

  def self.down
    drop_table :authors
    drop_table :authorships
  end
end
