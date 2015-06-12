class AddAttachmentTitlePhotoToCities < ActiveRecord::Migration
  def self.up
    change_table :cities do |t|
      t.attachment :title_photo
    end
  end

  def self.down
    remove_attachment :cities, :title_photo
  end
end
