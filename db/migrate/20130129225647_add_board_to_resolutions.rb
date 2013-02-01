class AddBoardToResolutions < ActiveRecord::Migration
  def change
    add_column :resolutions, :board_id, :integer
  end
end
