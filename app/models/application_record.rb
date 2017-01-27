class ApplicationRecord < ActiveRecord::Base
  DESCRIPTION_LIMIT   = 5000

  self.abstract_class = true
end
