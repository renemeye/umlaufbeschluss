class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.string :title
      t.text :resolution_text

      t.timestamps
    end
  end
end
