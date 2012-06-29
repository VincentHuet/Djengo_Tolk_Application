class CreateYmlSources < ActiveRecord::Migration
  
  def change
    drop_table :yml_sources
    create_table :yml_sources do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
