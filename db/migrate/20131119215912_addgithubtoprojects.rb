class Addgithubtoprojects < ActiveRecord::Migration
  def change
    add_column :projects, :github, :string
  end
end
