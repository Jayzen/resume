class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  scope :zh, -> { where(language: "zh") }
  scope :en, -> { where(language: "en") }
  scope :zh_order, -> { zh.order("weight desc") }
  scope :en_order, -> { en.order("weight desc") }
end
