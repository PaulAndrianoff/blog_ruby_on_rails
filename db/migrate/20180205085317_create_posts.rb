class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      #t.belongs_to :user
      t.references :user, null: false, foreign_key: { name: 'user_author' }
    
      t.string     :title,          null: false, limit: 150
      t.string     :description,    null: false, limit: 250
      t.text       :post_text,      null: false
      t.string     :image_url,      null: false, limit: 150
      
      t.timestamps
      
    end
  end
end
