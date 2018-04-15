class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  module OrderStatus
    Chinese = 'zh'
    English = 'en'
  end
end
