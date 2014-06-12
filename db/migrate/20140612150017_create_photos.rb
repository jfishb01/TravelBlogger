class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :stop
      t.belongs_to :journey
      t.string :caption
    end
  end
end
