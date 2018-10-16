class AddPriceToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :price, :decimal, precision: 16, scale: 2
  end
end
