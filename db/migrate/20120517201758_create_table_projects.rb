class CreateTableProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :source_repository
      t.integer :highlight_ids
    end
  end
end
