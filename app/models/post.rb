class Post < ApplicationRecord

    belongs_to :user
    has_many   :comments

    validates :title, presence: true
    validates :title, length: { maximum: 255 }
    validates :post_text, presence: true

end
