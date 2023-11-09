class Post < ApplicationRecord
    mount_uploader :board_image, BoardImageUploader
    belongs_to :user
    validates :title, presence: true, length: { maximum: 255 }
    validates :content, presence: true
end
