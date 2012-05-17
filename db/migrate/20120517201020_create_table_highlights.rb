class CreateTableHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.text :code_snippet
      t.text :description
      t.integer :project_id
    end
  end
end
