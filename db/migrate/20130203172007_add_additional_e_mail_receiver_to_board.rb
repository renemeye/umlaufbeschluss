class AddAdditionalEMailReceiverToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :additional_email_receiver, :string
  end
end
