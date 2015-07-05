class AddUtcOffsetToCities < ActiveRecord::Migration
  def change
    add_column :cities, :utcoffset, :string, limit: 6
  end
end
