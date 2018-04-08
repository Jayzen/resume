class Education < ApplicationRecord
  belongs_to :user, optional: true
  validates :school, :degree, :major, :gpa, :time, :weight, presence: true
end
