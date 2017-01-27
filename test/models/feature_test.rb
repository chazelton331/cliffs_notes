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

require 'test_helper'

class FeatureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
