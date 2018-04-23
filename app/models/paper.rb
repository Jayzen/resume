class Paper < ApplicationRecord
  belongs_to :user, optional: true
  validates :language, :time, :title, :description, :author_ranking, :paper_level, :weight, presence: true
end
