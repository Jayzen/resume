class Wechat < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :name, WechatUploader
end
