class Post < ApplicationRecord
    mount_uploader :board_image, BoardImageUploader
    has_many :messages, dependent: :destroy
    belongs_to :user
    validates :title, presence: true, length: { maximum: 255 }
    validates :content, presence: true
    validates :kind, presence: true, length: { maximum: 100 }
    validates :date_and_time, presence: true, length: { maximum: 100}
    validates :place, presence: true, length: { maximum: 100 }
end
