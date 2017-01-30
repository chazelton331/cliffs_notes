class RollFeaturesAndRemindersIntoNotes < ActiveRecord::Migration[5.0]
  def up
    begin
      Feature.all.each do |feature|
        Note.create!(description: feature.description, keywords: feature.squad, priority: feature.priority)
      end
    rescue
      puts "Feature model does not exist... skipping"
    end

    begin
      Reminder.all.each do |reminder|
        Note.create!(description: reminder.description, due_date: reminder.due_date)
      end
    rescue
      puts "Reminder model does not exist... skipping"
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new("We can't go back, it's too dangerous!\n~Col. Sanders")
  end
end
