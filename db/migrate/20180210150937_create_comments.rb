class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

      #t.belongs_to :user
      t.references :user, null: false, foreign_key: { name: 'user_author' }
      t.references :post, null: false, foreign_key: { name: 'post_on_comment' }

      t.text       :description,          null: false, limit: 5000
      t.timestamps
      
    end
  end
end
