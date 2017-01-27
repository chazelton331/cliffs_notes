# == Schema Information
#
# Table name: features
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  priority    :integer          default("0"), not null
#  description :text
#  squad       :string
#

class Feature < ApplicationRecord
end
