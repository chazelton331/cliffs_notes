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

require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  setup do
    @note = Note.new(description: "This is OK")
  end

  test "description too long" do
    @note.description = 'a' * (Note::DESCRIPTION_LIMIT + 1)

    assert(@note.invalid?)
    assert_equal([ "Description is too long (maximum is #{Note::DESCRIPTION_LIMIT} characters)" ], @note.errors.full_messages)
  end

  test "description can't be nil" do
    @note.description = nil

    assert(@note.invalid?)
    assert_equal([ "Description can't be blank" ], @note.errors.full_messages)
  end

  test "description can't be ''" do
    @note.description = ""

    assert(@note.invalid?)
    assert_equal([ "Description can't be blank" ], @note.errors.full_messages)
  end

end
