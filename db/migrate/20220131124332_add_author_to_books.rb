class AddAuthorToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :autor, index: true, foreign_key: true
  end
end
