class Wechat < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :name, WechatUploader

  validates :name, presence: true
  validates :status, presence: true
end
