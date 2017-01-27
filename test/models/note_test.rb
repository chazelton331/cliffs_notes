# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  test "description too long" do
    bad_note = Note.new(description: 'a' * (Note::DESCRIPTION_LIMIT + 1))

    assert(bad_note.invalid?)

    assert_equal([ "Description is too long (maximum is #{Note::DESCRIPTION_LIMIT} characters)" ], bad_note.errors.full_messages)
  end

  test "description required" do
    bad_note1 = Note.new(description: nil)
    bad_note2 = Note.new(description: "" )

    assert(bad_note1.invalid?)
    assert(bad_note2.invalid?)

    assert_equal([ "Description can't be blank" ], bad_note1.errors.full_messages)
    assert_equal([ "Description can't be blank" ], bad_note2.errors.full_messages)
  end

end
