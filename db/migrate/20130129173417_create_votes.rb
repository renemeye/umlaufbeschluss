class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :voting
      t.string :invite_code
      t.references :resolution

      t.timestamps
    end
    add_index :votes, :resolution_id
  end
end
