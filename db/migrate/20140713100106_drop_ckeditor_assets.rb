class DropCkeditorAssets < ActiveRecord::Migration
  def change
    remove_index :ckeditor_assets, :name => :idx_ckeditor_assetable
    remove_index :ckeditor_assets, :name => :idx_ckeditor_assetable_type
    drop_table :ckeditor_assets
  end
end
