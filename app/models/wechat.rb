class Wechat < ApplicationRecord
  belongs_to :user
  mount_uploader :name, WechatUploader
end
