class ChangeReleaseDateToPublicationDate < ActiveRecord::Migration
  def self.up
    rename_column :books, :release_date, :publication_date
  end

  def self.down
    rename_column "table", "new_name", "column"
  end
end
