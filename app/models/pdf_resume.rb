class PdfResume < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :language, presence: true
  validates :name, presence: true
  validates :language, uniqueness: true
  
  mount_uploader :name, PdfResumeUploader
end
