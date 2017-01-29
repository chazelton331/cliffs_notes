# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  priority    :integer          default("0"), not null
#  keywords    :string
#  due_date    :datetime
#

class Note < ApplicationRecord
  DESCRIPTION_LIMIT = 5000

  validates :description, presence: true,
                          length: { maximum: DESCRIPTION_LIMIT }

  # validate due date must be in the future
  # validate 

end
