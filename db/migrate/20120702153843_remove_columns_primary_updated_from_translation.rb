class RemoveColumnsPrimaryUpdatedFromTranslation < ActiveRecord::Migration
  def up
    remove_column :translations, :Primary_updated
  end
  
  def down
    add_column :translations, :Primary_updated
  end
end
