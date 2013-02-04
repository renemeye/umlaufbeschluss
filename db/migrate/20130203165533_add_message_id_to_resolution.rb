class AddMessageIdToResolution < ActiveRecord::Migration
  def change
    add_column :resolutions, :message_id, :string
  end
end
