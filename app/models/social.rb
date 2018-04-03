class Social < ApplicationRecord
  belongs_to :user, optional: true
  
  VALID_URL_REGEX = /https?:\/\/[\S]+/
  
  validates :url, presence: true
  validates :url, format: { with: VALID_URL_REGEX }, unless: proc{ |social| social.url.blank? }
  validates :name, presence: true
  validates :name, uniqueness: { message: "%{value}只能创建一次" }
end
