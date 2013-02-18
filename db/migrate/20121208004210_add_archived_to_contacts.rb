class AddArchivedToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :archived, :boolean, default: false
  end
end
