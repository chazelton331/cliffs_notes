class AddBasicRemindersColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :reminders, :description, :text
    add_column :reminders, :due_date,    :datetime
  end
end
