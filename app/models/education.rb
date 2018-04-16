class Education < ApplicationRecord
  belongs_to :user, optional: true
  validates :school, :degree, :major, :gpa, :time, :weight, :language, presence: true
end
