class AddTitleToHighlights < ActiveRecord::Migration
  def up
    add_column :highlights, :title, :string, :default => "Highlight"
  end

  def down
    remove_column :highlights, :title, :string
  end
end
