class ChangeColumnPostsBlogIdToJourneyId < ActiveRecord::Migration
  def change
    remove_column :posts, :blog_id
    add_column :posts, :journey_id, :integer
  end
end
