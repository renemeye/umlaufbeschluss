class ChangePasswordDigestStuffOnPeople < ActiveRecord::Migration
  def up
		remove_column :people, :password
		add_column :people, :password_digest, :string
  end

  def down
		remove_column :people, :password_digest
		add_column :people, :password, :string
  end
end
