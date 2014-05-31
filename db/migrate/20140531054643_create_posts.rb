class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :blog
      t.belongs_to :user
      t.string :location
      t.string :title
      t.float :latitude
      t.float :longitude
      t.text :content
    end
  end
end
