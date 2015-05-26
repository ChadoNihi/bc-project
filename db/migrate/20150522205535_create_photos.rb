class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :source
      t.string :author
      t.references :city, index: true

      t.timestamps
    end
  end
end
