class DropAuthors < ActiveRecord::Migration
  def self.up
    drop_table :authors, :authorships
  end

  def self.down
  end
end
