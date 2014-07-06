class AddSlugToUsers < ActiveRecord::Migration
  def change
    add_column :users, :obfuscated_id, :string
    add_column :users, :slug, :string
    add_index :users, :slug
  end
end
