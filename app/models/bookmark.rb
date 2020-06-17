class Bookmark < ApplicationRecord
    belongs_to :book
    validates :title, presence: true,
        length: {maximum: 50}
    validates :post, presence: true
end
