class AddReferencesToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :membership_id, :integer
  end
end
