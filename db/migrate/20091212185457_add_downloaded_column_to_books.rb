class AddDownloadedColumnToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :has_cover, :boolean, :default=>0
    add_column :books, :small_cover, :string
    add_column :books, :medium_cover, :string
    add_column :books, :large_cover, :string
  end

  def self.down
    remove_column :books, :has_cover
    remove_column :books, :small_cover
    remove_column :books, :medium_cover
    remove_column :books, :small_cover
  end
end
