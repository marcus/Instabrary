class RenameBindingToBookBinding < ActiveRecord::Migration
  def self.up
    rename_column "books", "binding", "book_binding"
  end

  def self.down
    rename_column "books", "book_binding", "binding"
  end
end
