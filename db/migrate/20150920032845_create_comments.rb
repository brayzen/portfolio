class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :post
      t.boolean :verified
      t.references :author_id, index: true, foreign_key: true
      t.references :user_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
