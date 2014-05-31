class ChangeBlogsToJourneys < ActiveRecord::Migration
  def change
    rename_table :blogs, :journeys
  end
end
