class RollFeaturesAndRemindersIntoNotes < ActiveRecord::Migration[5.0]
  def up
    Feature.all.each do |feature|
      Note.create!(description: feature.description, keywords: feature.squad, priority: feature.priority)
    end

    Reminder.all.each do |reminder|
      Note.create!(description: reminder.description, due_date: reminder.due_date)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new("We can't go back, it's too dangerous!\n~Col. Sanders")
  end
end
