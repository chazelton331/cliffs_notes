class AddBasicFeaturesColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :priority,    :integer, default: 0, null: false
    add_column :features, :description, :text
    add_column :features, :squad,       :string
  end
end
