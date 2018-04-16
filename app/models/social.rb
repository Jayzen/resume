class Social < ApplicationRecord
  belongs_to :user, optional: true
  
  VALID_URL_REGEX = /https?:\/\/[\S]+/
  validates :language, :name, :url, :weight, presence: true
  validates :url, format: { with: VALID_URL_REGEX }, unless: proc{ |social| social.url.blank? }
  validates :name, uniqueness: { scope: :user_id, message: "%{value}只能创建一次" }
end
