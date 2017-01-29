class ConsolidateAllModelsIntoNote < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :priority, :integer, default: 0, null: false
    add_column :notes, :keywords, :string
    add_column :notes, :due_date, :datetime
  end
end
