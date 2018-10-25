class ChangeBookAuthorRelationshipToBelongsTo < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :author_id, :integer
    drop_table :book_authors
  end
end
