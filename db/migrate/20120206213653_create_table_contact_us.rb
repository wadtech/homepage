class CreateTableContactUs < ActiveRecord::Migration
  def change
    create_table :contact_us do |t|
      t.text :subject
      t.text :content
      t.string :source_ip

      t.timestamps
    end
  end
end
