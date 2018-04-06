class PdfResume < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :name, PdfResumeUploader
end
