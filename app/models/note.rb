# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Note < ApplicationRecord
  validates :description, presence: true,
                          length: { maximum: DESCRIPTION_LIMIT }

end
