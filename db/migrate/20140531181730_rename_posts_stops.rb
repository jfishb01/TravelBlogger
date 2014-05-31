class RenamePostsStops < ActiveRecord::Migration
  def change
    rename_table :posts, :stops
  end
end
