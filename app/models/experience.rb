class Experience < ApplicationRecord
  belongs_to :user, optional: true
  validates :company, :position, :description, :weight, :time, presence: true
end
