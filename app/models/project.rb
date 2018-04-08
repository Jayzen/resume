class Project < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, :tag, :time, :description, :weight, presence: true
end
