class RemoveColumnEnValueFromPhrase < ActiveRecord::Migration
  def up
    remove_column :phrases, :en_value
  end
  
  def down
    add_column :phrases, :en_value
  end
end