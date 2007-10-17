class AddAuthorToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :authors, :string
  end

  def self.down
  end
end
