class AddSlugToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :obfuscated_id, :string
    add_column :journeys, :slug, :string
    add_index :journeys, :slug
  end
end
