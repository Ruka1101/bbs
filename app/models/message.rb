class Message < ApplicationRecord
    belongs_to :post, optional: true
    validates :sender_name, presence: true
    validates :sender_email, presence: true
    validates :subject, presence: true
    validates :content, presence: true
end
