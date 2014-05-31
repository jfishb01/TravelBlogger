class ChangeBlogsNameToTitle < ActiveRecord::Migration
  def change
    remove_column :blogs, :name
    add_column :blogs, :title, :string
  end
end
