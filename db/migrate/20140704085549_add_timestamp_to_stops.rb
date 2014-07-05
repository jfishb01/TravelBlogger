class AddTimestampToStops < ActiveRecord::Migration
  def change_table
    add_column(:stops, :created_at, :datetime)
    add_column(:stops, :updated_at, :datetime)
  end
end
