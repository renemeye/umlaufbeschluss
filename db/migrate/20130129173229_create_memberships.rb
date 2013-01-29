class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.datetime :from
      t.datetime :to
      t.references :board
      t.references :person

      t.timestamps
    end
    add_index :memberships, :board_id
    add_index :memberships, :person_id
  end
end
