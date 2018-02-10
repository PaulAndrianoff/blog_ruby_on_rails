class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :post

    validates :description, presence: true
    # validates :description, length: { maximum: 5000 }

end
