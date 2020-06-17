class Book < ApplicationRecord
    has_many :bookmarks
    has_many :comments
    validates :name, presence: true,
        length: {minimum: 8}
end
