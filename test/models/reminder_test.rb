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

require 'test_helper'

class ReminderTest < ActiveSupport::TestCase

  setup do
    @reminder = Reminder.new(description: "This is OK", due_date: Time.now)
  end

  test "description too long" do
    @reminder.description = 'a' * (Reminder::DESCRIPTION_LIMIT + 1)

    assert(@reminder.invalid?)
    assert_equal([ "Description is too long (maximum is #{Reminder::DESCRIPTION_LIMIT} characters)" ], @reminder.errors.full_messages)
  end

  test "description can't be nil" do
    @reminder.description = nil

    assert(@reminder.invalid?)
    assert_equal([ "Description can't be blank" ], @reminder.errors.full_messages)
  end

  test "description can't be ''" do
    @reminder.description = ""

    assert(@reminder.invalid?)
    assert_equal([ "Description can't be blank" ], @reminder.errors.full_messages)
  end

  test "due_date can't be nil" do
    @reminder.due_date = nil

    assert(@reminder.invalid?)
    assert_equal([ "Due date can't be blank" ], @reminder.errors.full_messages)
  end

  test "due_date can't be ''" do
    @reminder.due_date = ""

    assert(@reminder.invalid?)
    assert_equal([ "Due date can't be blank" ], @reminder.errors.full_messages)
  end

end
