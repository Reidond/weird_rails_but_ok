class Meme < ApplicationRecord
    belongs_to :user
    enum meme_type: [:easy_meme, :long_meme, :short_meme]
    validates :title, presence: true
    has_one_attached :picture
end
