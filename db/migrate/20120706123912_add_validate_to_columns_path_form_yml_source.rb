class AddValidateToColumnsPathFormYmlSource < ActiveRecord::Migration
  def change
    add_index :yml_sources, :path, :unique => true
  end
end
