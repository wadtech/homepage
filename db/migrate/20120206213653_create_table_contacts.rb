class CreateTableContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :subject
      t.text :content
      t.string :source_ip

      t.timestamps
    end
  end
end
