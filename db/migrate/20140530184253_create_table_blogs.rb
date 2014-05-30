class CreateTableBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.belongs_to :user
      t.string :name
      t.attachment :photo

      t.timestamps
    end
  end
end
