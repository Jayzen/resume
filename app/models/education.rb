class Education < ApplicationRecord
  belongs_to :user, optional: true
end
