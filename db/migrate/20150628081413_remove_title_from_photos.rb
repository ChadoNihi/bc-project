class RemoveTitleFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :title, :string
  end
end
