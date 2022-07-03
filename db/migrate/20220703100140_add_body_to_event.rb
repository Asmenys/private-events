class AddBodyToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :body, :text
  end
end
