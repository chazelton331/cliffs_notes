# == Schema Information
#
# Table name: reminders
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  due_date    :datetime
#

class Reminder < ApplicationRecord
  validates :description, presence: true,
                          length: { maximum: DESCRIPTION_LIMIT }

  validates :due_date,    presence: true
end
