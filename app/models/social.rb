class Social < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :name, uniqueness: { message: "%{value}只能创建一次" }
end
