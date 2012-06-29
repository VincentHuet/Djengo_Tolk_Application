class CreateYmlSources < ActiveRecord::Migration
  def change
    create_table :yml_sources do |t|

      t.timestamps
    end
  end
end
