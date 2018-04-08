class Skill < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, :weight, :description, presence: true
end
