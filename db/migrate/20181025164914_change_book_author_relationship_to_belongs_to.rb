class ChangeBookAuthorRelationshipToBelongsTo < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :author_id, :integer

    Book.all.each do |book|
      author = book.authors.first
      book.update!(author_id: author.id)
    end

    drop_table :book_authors
  end
end
