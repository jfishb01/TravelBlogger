class AddTimestampToStopsAgain < ActiveRecord::Migration
  def change
    add_column :stops, :updated_at, :datetime
    add_column :stops, :created_at, :datetime
    add_column :stops, :start_date, :datetime
    add_column :stops, :end_date, :datetime
  end
end
