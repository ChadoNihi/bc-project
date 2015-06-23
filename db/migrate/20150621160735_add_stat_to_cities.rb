class AddStatToCities < ActiveRecord::Migration
  def change
  	add_column :cities, :foundation_date, :string, :limit => 28
  	add_column :cities, :population, :integer, :limit => 8
  	add_column :cities, :density, :integer, :limit => 3
  	add_column :cities, :website, :string, :limit => 160
  end
end
