class AddDetailsToResolutions < ActiveRecord::Migration
  def change
    add_column :resolutions, :reasons, :string
    add_column :resolutions, :requestor, :string
  end
end
